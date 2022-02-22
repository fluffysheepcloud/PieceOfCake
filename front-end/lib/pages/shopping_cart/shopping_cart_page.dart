import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/pages/shopping_cart/shopping_cart_card.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {

  Future<List> mockData() async {
    final String res = await rootBundle.loadString('assets/mock/shopping_cart_mock.json');
    var data = json.decode(res)["cart"] as List;
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }

  Widget _cardBuilder(AsyncSnapshot snapshot) {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return Dismissible(key: UniqueKey(),
              direction: DismissDirection.endToStart,
              child: ShoppingCartCard(
                orderCakeID: snapshot.data[index]['orderCakeID'],
                imageURL: snapshot.data[index]['imageURL'],
                cakeSize: snapshot.data[index]['cakeSize'],
                baseColor: snapshot.data[index]['baseColor'],
                baseFlavor: snapshot.data[index]['baseFlavor'],
                frostingColor: snapshot.data[index]['frostingColor'],
                frostingFlavor: snapshot.data[index]['frostingFlavor'],
                price: snapshot.data[index]['price'],
                dataIndex:index.toInt(),
          ),
          );
        }
    );
  }

}

