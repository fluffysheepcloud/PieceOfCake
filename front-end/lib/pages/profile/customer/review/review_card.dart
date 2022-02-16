import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 160.0,
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
                _orderNumber(),
                Divider(thickness: 2.0, color: Colors.brown[200],),
                _pictureAndComment(),
                _rating()
              ],
            ),),
        )
      )
    );
  }

  // Display order number and "completed" status
  Widget _orderNumber() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Padding(padding: EdgeInsets.only(left: 8, top: 5), child: Text("Order#: 123456")),
        Padding(padding: EdgeInsets.only(right: 8, top: 5), child: Text("Completed")),
      ],
    );
  }

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
                child: Image.asset("assets/images/cake.jpg", fit: BoxFit.cover),
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
                    "comment...comment...comment...comment...comment...comment...comment...comment...comment...comment...ccckkkccckkkccckkkccckkk",
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
  Widget _rating() {
    return Padding(
      padding: EdgeInsets.only(left: 200, top: 5),
      child: SmoothStarRating(
        rating: 4.5,
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
