import 'package:flutter/material.dart';
import 'package:frontend/pages/shopping_cart/shopping_cart_card.dart';

class summaryCard extends StatelessWidget {
  String orderCakeID;
  String cakeName;
  String imageURL;
  double cakeSize;
  String baseColor;
  String baseFlavor;
  String frostingColor;
  String frostingFlavor;
  double price;
  int dataIndex;
  int quantity;
  List  quantityList;

  summaryCard({required this.orderCakeID, required this.cakeName, required this.imageURL,
    required this.cakeSize, required this.baseColor, required this.baseFlavor,
    required this.frostingColor, required this.frostingFlavor, required this.price,
    required this.dataIndex, required this.quantity,required this.quantityList, Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            height: 220.0,
            child: Card(
              elevation: 5,
              color: Colors.grey[200],
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5.0)),
              child: InkWell(
                onTap: () {
                  // TODO: navigate to a order detail page
                },
                child: Column(
                  children: [
                    _summaryTitle(),
                    Divider(thickness: 2.0, color: Colors.brown[200],),
                    _pictureAndInfo(),
                    _price(dataIndex),


                  ],
                ),),
            )
        )
    );
  }

  // Display order number and "completed" status
  Widget _summaryTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(padding: EdgeInsets.only(left: 8, top: 5), child: Text("Order#: ${orderCakeID}")),
        //Padding(padding: EdgeInsets.only(right: 8, top: 5), child: Text("Cake name: ${cakeName}")),
      ],
    );
  }

  // Display cake pic and the comment for this order
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
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Column(
                children: [
                  Text(quantity.toString()),
                ],
              ),
            )
        )],
    );
  }

  Widget _price(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: EdgeInsets.only(
                left: 8, top: 5),
            child: Text(
                "Unit Price: ${price},"
                    "qu: ${quantityList[dataIndex]}"
            )
        ),
      ],
    );
  }

}


