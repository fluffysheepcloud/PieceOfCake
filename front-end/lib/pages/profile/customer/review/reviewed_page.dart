import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/customer/review/review_card.dart';

class ReviewedPage extends StatelessWidget {
  const ReviewedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ReviewCard(),
            ReviewCard(),
            ReviewCard(),
            ReviewCard()
          ],
        ),
      )
    );
  }
}
