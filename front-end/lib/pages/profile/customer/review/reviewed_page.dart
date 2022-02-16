import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/customer/review/review_card.dart';

class ReviewedPage extends StatefulWidget {
  const ReviewedPage({Key? key}) : super(key: key);

  @override
  _ReviewedPageState createState() => _ReviewedPageState();
}

class _ReviewedPageState extends State<ReviewedPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
        itemCount: 5,
        itemBuilder: (context, index) {
          return ReviewCard();
        }
      ),
    );
  }
}

