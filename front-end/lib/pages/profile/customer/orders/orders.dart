import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/pages/profile/customer/orders/order_card.dart';

class CustomerAllOrdersPage extends StatefulWidget {

  final arguments;

  const CustomerAllOrdersPage({Key? key, this.arguments}) : super(key: key);

  @override
  _CustomerAllOrdersPageState createState() => _CustomerAllOrdersPageState();
}

class _CustomerAllOrdersPageState extends State<CustomerAllOrdersPage> {

  Future<List> _mockData() async {
    final String res = await rootBundle.loadString('assets/mock/all_orders.json');
    var data = json.decode(res)["data"] as List;
    return data;
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List>(
        future: _mockData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return Scaffold(
                appBar: AppBar(title: Text("All Orders")),
                body: _cardBuilder(snapshot)
              );
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
          return OrderCard(snapshot.data[index]);
        }
    );

  }
}

