import 'package:flutter/material.dart';
import 'package:frontend/components/card_title.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class ReviewCard extends StatelessWidget {

  String orderNumber;
  String imageURL;
  String comment;
  double rating;

  ReviewCard({required this.orderNumber, required this.imageURL, required this.comment, required this.rating, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 160.0,
        child: Card(
          elevation: 5,
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5.0)),
          child: InkWell(
            onTap: () {
              // TODO: navigate to a order detail page
            },
            child: Column(
              children: [
                CardTitle(orderNumber, "Completed"),
                Divider(thickness: 2.0, color: Colors.brown[200],),
                _pictureAndComment(),
                _ratingWidget()
              ],
            ),),
        )
      )
    );
  }

  // Display order number and "completed" status


  // Display cake pic and the comment for this order
  Widget _pictureAndComment() {
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
                    comment,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5
                ),
              ),
            )
        ),
      ],
    );
  }

  // Display rating stars
  Widget _ratingWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 200, top: 5),
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
    );
  }

}
