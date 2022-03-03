import 'package:flutter/material.dart';
import 'package:frontend/components/card_title.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class OrderCard extends StatelessWidget {

  final Map<String, dynamic> arguments;

  const OrderCard(this.arguments, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
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
                  CardTitle(arguments["orderNumber"], arguments["status"]),
                  Divider(thickness: 2.0, color: Colors.brown[200],),
                  _pictureAndCakeInfo(arguments["imageURL"], arguments["cakeName"], arguments["cakeSize"]),
                  _dateAndRating(arguments["date"], arguments["rate"])
                ],
              ),),
          )
      ),
    );

  }

  Widget _pictureAndCakeInfo(String imageURL, String cakeName, double size) {
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
          child: Column(
            children: [
              Text(cakeName, style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 20),
              Text("Cake Size:" + size.toString())
            ],
          )
        ),
      ],
    );
  }

  Widget _dateAndRating(String date, double rating) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(date),
          Padding(
            padding: EdgeInsets.only(left: 0, top: 5),
            child: SmoothStarRating(
              rating: rating,
              size: 20,
              color: Colors.yellow[700],
              borderColor: Colors.yellow[700],
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              defaultIconData: Icons.star_border,
              allowHalfRating: false,
              onRatingChanged: (value) {},
            ),
          )
        ],
      )
    );
  }
}
