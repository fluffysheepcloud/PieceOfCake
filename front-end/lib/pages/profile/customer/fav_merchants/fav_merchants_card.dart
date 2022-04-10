import 'package:flutter/material.dart';

class FavMerchantCard extends StatelessWidget {

  final String imageUrl;
  final String merchantName;

  const FavMerchantCard(this.imageUrl, this.merchantName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: navigate to merchant home page
        print("Customer Fav Merchant Tap...");
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.11,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            border:Border(bottom:BorderSide(width: 1,color: Color(0xffe5e5e5)))
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage(imageUrl),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(merchantName),
            ),
          ],
        ),
      ),
    );
  }
}
