import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/common.dart';
import 'package:frontend/network/customer_service.dart';
import 'package:frontend/pages/profile/customer/review/review_card.dart';
import 'package:frontend/utils/shared_preferences.dart';

class ReviewedPage extends StatefulWidget {
  const ReviewedPage({Key? key}) : super(key: key);

  @override
  _ReviewedPageState createState() => _ReviewedPageState();
}

class _ReviewedPageState extends State<ReviewedPage> {

  Future<List> getData() async {
    int id = (await SPUtil.getUserData())["id"];
    var res = await getCustomerReviewedOrders(id);
    var data = json.decode(res)["data"] as List;
    return data;
  }


  @override
  Widget build(BuildContext context) {

    return Center(
      child: FutureBuilder<List>(
        future: getData(),
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
            orderNumber: snapshot.data[index][Common.ORDER_NUMBER],
            imageURL: "assets/images/cake.jpg",
            comment: snapshot.data[index][Common.CAKE_COMMENT],
            rating: snapshot.data[index][Common.CAKE_RATE],
          );
        }
    );
  }

}

