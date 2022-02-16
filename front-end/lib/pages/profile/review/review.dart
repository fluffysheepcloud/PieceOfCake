import 'package:flutter/material.dart';

class Review extends StatefulWidget {

  var arguments;

  Review({Key? key, this.arguments}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: const [
              Tab(text: "Reviewed"),
              Tab(text: "Unreviewed"),
            ],
          ),
        ),
        body: TabBarView(
          children: const [
            Text("Test 1"),
            Text("Test 2"),
          ],
        ),
      )
    );
  }
}
