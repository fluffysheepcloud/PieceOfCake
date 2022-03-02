

import 'package:flutter/material.dart';

class CakeProductPage extends StatelessWidget {

  var arguments;

  CakeProductPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Cake Product Page..."),
      ),
    );
  }
}
