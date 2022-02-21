import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/customer/shopping_cart/shopping_cart_page.dart';

class ShoppingCart extends StatefulWidget {
  var arguments;

  ShoppingCart({Key? key, this.arguments}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      appBar: AppBar(title:
      Text("Shopping Cart")),
      body: ShoppingCartPage(),
    );
  }
}
