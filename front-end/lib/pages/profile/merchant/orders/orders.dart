

import 'package:flutter/material.dart';

class MerchantOrdersPage extends StatelessWidget {

  var arguments;

  MerchantOrdersPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Merchant Orders Page..."),
      ),
    );
  }
}
