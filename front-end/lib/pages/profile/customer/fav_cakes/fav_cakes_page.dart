

import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/customer/fav_cakes/fav_cakes_card.dart';

class FavCakesPage extends StatelessWidget {

  var arguments;

  FavCakesPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Cakes")),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          // return FavCakesCard("assets/images/cake_4.jpg", "Demo Cake", "${index * 20}");
          return Text("1231");
        }
      )
    );
  }
}
