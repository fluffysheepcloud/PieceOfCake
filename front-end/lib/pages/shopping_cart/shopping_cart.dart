import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/network/prebuilt_cake_service.dart';
import 'package:frontend/pages/shopping_cart/shopping_cart_card.dart';
import 'package:frontend/utils/shared_preferences.dart';

class ShoppingCartPage extends StatefulWidget {

  var argumenets;

  ShoppingCartPage({this.argumenets, Key? key}) : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {

  List<int> quantity = [];

  Future<List> mockData() async {
    List data = [];
    await SPUtil.updateLoginStatus();
    if (SPUtil.loginStatus == -1) {
      SPUtil.clearCakes();
    }

    Map m = await SPUtil.getCakes();


    List keys = m.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      Map cake = (await getPrebuildCakeById(int.parse(keys[i])))["data"];
      data.add(cake);
    }

    // quantity = List.generate(data.length, (index) => 1);
    for (int i = 0; i < data.length; i++) {
      int id = data[i]["id"];
      data[i]["orderCakeID"] = id;
      data[i]["imageURL"] = "assets/images/cake.jpg";
      quantity.add(m[id.toString()]);
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shopping Cart")),
      body: Center(
        child: FutureBuilder<List>(
          future: mockData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return _cardBuilder(snapshot);
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      )
    );
  }

  Widget _cardBuilder(AsyncSnapshot snapshot) {

    var itemList = _itemCarBuilder(snapshot);

    return Container(
        color: Color.fromARGB(255, 249, 243, 235),
        child: ListView(
          padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
          children: itemList,
        )
    );
  }

  List<Widget> _itemCarBuilder(AsyncSnapshot snapshot){

    List itemInfo = snapshot.data;
    List<Widget> list = List.generate(
      itemInfo.length,
      (index) => Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) async {
          // quantity?.removeAt(index);
          //widget.argumenets?.removeAt(index);

          if (quantity.length == 1) {
            quantity.removeAt(0);
          }
          else {
            quantity.removeAt(index);
          }
          await SPUtil.removeCake(itemInfo[index]["id"]);

          setState(() {

          });


        },

        child: ShoppingCartCard(
          itemInfo[index],
          index,
          quantity
        ),
      ),
    );

    list.add(
      Padding(
        padding: EdgeInsets.only(bottom: 25, top: 10),
        child: ElevatedButton(
          onPressed: (snapshot.data.length > 0) ? (){
             Navigator.of(context).pushNamed( "/shopping_cart/summary", arguments: {
               "data": snapshot.data,
               "quantity": quantity
             });
          } : null,
          child: Text("Proceed to checkout")
        ),
      )
    );
    return list;
  }
}