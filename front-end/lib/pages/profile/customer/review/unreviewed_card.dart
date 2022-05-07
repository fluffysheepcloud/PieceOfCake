import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class UnreviewedCard extends StatefulWidget {

  final VoidCallback onDeleteClicked;
  String orderNumber;
  String imageURL;

  UnreviewedCard({Key? key, required this.onDeleteClicked, required this.orderNumber, required this.imageURL}) : super(key: key);

  @override
  _UnreviewedCardState createState() => _UnreviewedCardState();
}

class _UnreviewedCardState extends State<UnreviewedCard> {

  double _rating = 0;
  TextEditingController _comment = TextEditingController();


  @override
  void initState() {
    super.initState();
    _comment.text = "testtesttesttesttesttesttesttesttesttesttesttest"
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttestt"
        "esttesttesttesttesttesttesttesttesttesttesttesttesttesttesttes"
        "ttesttesttesttesttesttesttesttest";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            height: 250.0,
            child: Card(
              elevation: 5,
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5.0)),
              child: Column(
                children: [
                  _orderNumber(),
                  Divider(thickness: 2.0, color: Colors.brown[200],),
                  _body(),
                  SizedBox(height: 5),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      minimumSize: Size(150, 30)
                    ),
                    onPressed: () {
                      print(123);
                      widget.onDeleteClicked();
                    },
                    child: Text("Submit")
                  )
                ],
              ),
            )
        )
    );
  }



  Widget _orderNumber() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(padding: EdgeInsets.only(left: 8, top: 5), child: Text("Order#: ${widget.orderNumber}")),
        Padding(padding: EdgeInsets.only(right: 8, top: 5), child: Text("Unreviewed")),
      ],
    );
  }

  Widget _body() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            _cakePic(),
            SizedBox(height: 10),
            Text("How's the cake?"),
            SizedBox(height: 5),
            _reviewRating()
          ],
        ),
        SizedBox(width: 10),
        _commentBox()
      ],
    );
  }

  Widget _cakePic() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 5, 0),
      child: SizedBox(
          height: 90,
          width: 135,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset("assets/images/cake.jpg", fit: BoxFit.cover),
          )
      ),
    );
  }

  Widget _reviewRating() {
    return SmoothStarRating(
      rating: _rating,
      size: 20,
      color: Colors.yellow[700],
      borderColor: Colors.yellow[700],
      filledIconData: Icons.star,
      halfFilledIconData: Icons.star_half,
      defaultIconData: Icons.star_border,
      allowHalfRating: true,
      onRatingChanged: (value) {
        setState(() {
          _rating = value;
          print(value);
        });
      },
    );
  }

  Widget _commentBox() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
            child: TextFormField(
              maxLines: 6,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true
              ),
              controller: _comment,
            )
        )
    );
  }

}
