

import 'package:flutter/material.dart';

class FavCakesPage extends StatelessWidget {

  var arguments;

  FavCakesPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Favorite Cakes Page..."),
      ),
    );
  }
}
