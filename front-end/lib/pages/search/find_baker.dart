import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/network/merchant_service.dart';
import 'package:frontend/components/merchant_card.dart';

class FindBaker extends StatefulWidget{

  const FindBaker({Key? key}) : super(key: key);

  @override
  _FindBakerState createState() => _FindBakerState();
}

//read in json array
//copy array into _items
//if query not empty and _items.contains(query) --> add

class _FindBakerState extends State<FindBaker>{
  List  _items = [];
  List results = [];
  String val = '';
  TextEditingController tc = new TextEditingController();

  readJson() async {
    var m1 = await getMerchantInfoById(1);
    var m2 = await getMerchantInfoById(2);
    var m3 = await getMerchantInfoById(3);

    //final String response = await rootBundle.loadString('assets/mock/sample.json');
    //final data = await json.decode(response);
    setState(() {
      _items.add(m1["data"]);
      _items.add(m2["data"]);
      _items.add(m3["data"]);
    });
    debugPrint(_items.toString());
  }

  @override
  void initState(){
    readJson();
  }

  void filterSearch(String query){
    debugPrint(_items.length.toString());
    for (var item in _items){
      if (item["shopName"].toLowerCase().contains(query.toLowerCase()) || item["description"].toLowerCase().contains(query.toLowerCase())){
        results.add(item);
        debugPrint(results.toString());
      }
    }
  }

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[50],
        body: SingleChildScrollView(
            child: Column(
              children:<Widget>[

                results.isNotEmpty
                    ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: results.length,
                    itemBuilder: (context, index){
                      return MerchantCard(results[index]["shopName"], results[index]["street"], results[index]["city"], results[index]["state"], results[index]["zip"], results[index]["id"]);
                    }
                )
                    : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _items.length,
                  itemBuilder: (context, index){
                    return MerchantCard(_items[index]["shopName"], _items[index]["street"], _items[index]["city"], _items[index]["state"], _items[index]["zip"], _items[index]["id"]);

                  },
                )
                //end searchbar
              ],
            )
        )
    );
  }
}