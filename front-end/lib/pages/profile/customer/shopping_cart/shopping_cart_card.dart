import 'package:flutter/material.dart';

class ShoppingCartCard extends StatelessWidget {
  String orderCakeID;
  String imageURL;
  double cakeSize;
  String baseColor;
  String baseFlavor;
  String frostingColor;
  String frostingFlavor;
  double price;
  int dataIndex;


  ShoppingCartCard({required this.orderCakeID, required this.imageURL,
    required this.cakeSize, required this.baseColor, required this.baseFlavor,
    required this.frostingColor, required this.frostingFlavor, required this.price,
    required this.dataIndex, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.85,
          height: 160.0,
          child: Card(
            elevation: 5,
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: Column(
              children: [
                _shoppingCartCardTitle(),
                _pictureAndInfo(),
                Divider(thickness: 2.0, color: Colors.brown[200],),
                _price(),
              ],
            ),),
        )
    );
  }
  Widget _shoppingCartCardTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: EdgeInsets.only(
                left: 8, top: 5),
            child: Text(
                "Cake ID: ${orderCakeID}")
        ),
      ],
    );
  }

  Widget _pictureAndInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
          child: SizedBox(
              height: 80,
              width:120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(imageURL, fit: BoxFit.cover),
              )
          ),
        ),
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: SizedBox(
                height: 80,
                width: 100,
                child: Text(
                    "Cake Size: ${cakeSize} '', Base color: ${baseColor}, Base flavor: ${baseFlavor},"
                        " Frosting Color:${frostingColor}, Frosting Flavor:${frostingFlavor}",

                    overflow: TextOverflow.ellipsis,
                    maxLines: 5
                ),

              ),
            )
        ),
      ],
    );
  }

  Widget _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: EdgeInsets.only(
                left: 8, top: 5),
            child: Text(
                "Unit Price: ${price},"
            )
        ),
      ],
    );
  }

}


