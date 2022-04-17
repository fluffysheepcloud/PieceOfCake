import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/network/merchant_service.dart';
import 'package:frontend/utils/shared_preferences.dart';

import 'capability_block.dart';

class CapabilityPage extends StatefulWidget {

  var arguments;

  CapabilityPage({this.arguments, Key? key}) : super(key: key);

  @override
  _CapabilityPageState createState() => _CapabilityPageState();
}

class _CapabilityPageState extends State<CapabilityPage> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Map>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: _blockBuilder(snapshot)
                  ),
                )
              );
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
    // return Container();
  }

  Future<Map> getData() async {
    int id = (await SPUtil.getUserData())["id"];
    var res = (await getMerchantCapability(id))["data"];
    return res;
  }

  Widget _blockBuilder(AsyncSnapshot snapshot) {
    Map data = snapshot.data;
    List keys = data.keys.toList();
    print(data[keys[0]]);
    List _keys = ["Base Size", "Base Colors",
      "Base Flavors", "Frosting Colors",
      "Frosting Flavors", "Toppings"];

    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return CapabilityBlock(blockLabel: _keys[index], items: data[keys[index]]);
        // return SizedBox();
      }
    );
  }

}
