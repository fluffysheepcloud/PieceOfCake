import 'package:flutter/material.dart';

class CustomerAllOrdersPage extends StatelessWidget {

  var arguments;

  CustomerAllOrdersPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Orders Page..."),
      ),
    );
  }
}
