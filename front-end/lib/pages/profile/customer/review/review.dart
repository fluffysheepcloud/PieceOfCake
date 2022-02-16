import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/customer/review/reviewed_page.dart';

class Review extends StatefulWidget {

  var arguments;

  Review({Key? key, this.arguments}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {

  static const List<Tab> myTabs = <Tab> [
    Tab(text: "Reviewed"),
    Tab(text: "Unreviewed")
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: myTabs
          ),
        ),
        body: TabBarView(
          children: [
            ReviewedPage(),
            ReviewedPage()
          ]
        ),
      )
    );
  }
}
