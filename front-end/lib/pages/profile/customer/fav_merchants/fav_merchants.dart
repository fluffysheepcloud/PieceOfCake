

import 'package:flutter/material.dart';

class FavMerchantsPage extends StatelessWidget {

  var arguments;

  FavMerchantsPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Favorite Merchants Page..."),
      ),
    );
  }
}
