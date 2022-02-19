import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/pages/profile/customer/review/review_card.dart';

class ReviewedPage extends StatefulWidget {
  const ReviewedPage({Key? key}) : super(key: key);

  @override
  _ReviewedPageState createState() => _ReviewedPageState();
}

class _ReviewedPageState extends State<ReviewedPage> {

  Future<List> mockData() async {
    final String res = await rootBundle.loadString('assets/mock/reviewed.json');
    var data = json.decode(res)["data"] as List;
    return data;
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: FutureBuilder<List>(
        future: mockData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return _cardBuilder(snapshot);
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _cardBuilder(AsyncSnapshot snapshot) {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return ReviewCard(
            orderNumber: snapshot.data[index]['orderNumber'],
            imageURL: snapshot.data[index]['imageURL'],
            comment: snapshot.data[index]['comment'],
            rating: snapshot.data[index]['rating'],
          );
        }
    );
  }

}

