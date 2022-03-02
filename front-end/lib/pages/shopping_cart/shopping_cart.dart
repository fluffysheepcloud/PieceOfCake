import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/pages/shopping_cart/shopping_cart_card.dart';

class ShoppingCartPage extends StatefulWidget {

  var argumenets;

  ShoppingCartPage({this.argumenets, Key? key}) : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {

  List<int>? quantity;

  Future<List> mockData() async {
    final String res = await rootBundle.loadString('assets/mock/shopping_cart_mock.json');
    var data = json.decode(res)["cart"] as List;
    quantity = List.generate(data.length, (index) => 1);
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
        onDismissed: (direction) {
          quantity?.removeAt(index);
        },
        child: ShoppingCartCard(
          itemInfo[index],
          index,
          quantity ?? []
        ),
      ),
    );

    list.add(
      Padding(
        padding: EdgeInsets.only(bottom: 25, top: 10),
        child: ElevatedButton(
          onPressed: (){
            // Navigator.pushNamed(context, "/shopping_cart/summary");
            print(quantity);
          },
          child: Text("Proceed to checkout")
        ),
      )
    );
    return list;
  }
}