import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/customer/review/unreviewed_card.dart';

class UnreviewedPage extends StatefulWidget {
  const UnreviewedPage({Key? key}) : super(key: key);

  @override
  _UnreviewedPageState createState() => _UnreviewedPageState();
}

class _UnreviewedPageState extends State<UnreviewedPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Center(
        child: ListView.builder(
            padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
            itemCount: 5,
            itemBuilder: (context, index) {
              return UnreviewedCard();
            }
        ),
      )
    );
  }
}

