import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/network/customer_service.dart';
import 'package:frontend/pages/profile/customer/review/unreviewed_card.dart';
import 'package:frontend/utils/shared_preferences.dart';

class UnreviewedPage extends StatefulWidget {
  const UnreviewedPage({Key? key}) : super(key: key);

  @override
  _UnreviewedPageState createState() => _UnreviewedPageState();
}

class _UnreviewedPageState extends State<UnreviewedPage> {


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
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Center(
        child: ListView.builder(
            padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return UnreviewedCard(
                key: ObjectKey(snapshot.data[index]),
                orderNumber: snapshot.data[index]["orderNumber"],
                imageURL: snapshot.data[index]["imageURL"],
                onDeleteClicked: () => _deleteItem(snapshot, index),
              );
            }
        ),
      )
    );
  }

  _deleteItem(AsyncSnapshot s, int index) {
    s.data.remove(s.data[index]);
    setState(() {});
  }

}

