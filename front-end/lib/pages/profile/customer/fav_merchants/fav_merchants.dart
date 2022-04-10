

import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/customer/fav_merchants/fav_merchants_card.dart';

class FavMerchantsPage extends StatelessWidget {

  var arguments;

  FavMerchantsPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Merchants"),),
      body: Center(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return FavMerchantCard("assets/images/merchant_avatar.jpg", "Test Merchant");
          }
        )
      ),
    );
  }
}
