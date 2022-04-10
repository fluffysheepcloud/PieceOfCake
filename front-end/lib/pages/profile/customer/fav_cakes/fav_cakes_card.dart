import 'package:flutter/material.dart';

class FavCakesCard extends StatelessWidget {

  final String imageUrl;
  final String cakeName;
  final String price;

  const FavCakesCard(this.imageUrl, this.cakeName, this.price, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: navigate to product detail page
        print("Customer Fav Cake Tap...");
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
                  child: Text(cakeName),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(180, 35, 0, 0),
                  child: Text("Price: \$${price}"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
