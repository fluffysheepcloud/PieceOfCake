import 'package:flutter/material.dart';

class FavCakesCard extends StatelessWidget {

  final String imageUrl;
  final Map cakeInfo;
  final String merchantName;

  const FavCakesCard(this.imageUrl, this.cakeInfo, this.merchantName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: navigate to product detail page
        print("Customer Fav Cake Tap...");
        Navigator.pushNamed(context, "/product_page", arguments: {
          "prebuildCakeId": cakeInfo["id"],
          "merchantName": merchantName,
          "cakeName": cakeInfo["cakeName"],
          "avatarURL": "assets/images/merchant_avatar.jpg",
          "cakeURLs": [
            "assets/images/cake.jpg",
            "assets/images/cake_2.jpg",
            "assets/images/cake_3.jpg",
            "assets/images/cake_4.jpg",
            "assets/images/cake_5.jpg"
          ],
          "description": "This is the description...",
          "price": cakeInfo["price"]
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            border:Border(bottom:BorderSide(width: 1,color: Color(0xffe5e5e5)))
        ),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(imageUrl),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Text(cakeInfo["cakeName"]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(180, 35, 0, 0),
                  child: Text("Price: \$${cakeInfo["price"].toString()}"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
