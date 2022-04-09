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
Widget _textBoxStyle({required String title}){
  return SizedBox(
    width: 400,
    child:Row(
        children:<Widget> [
         Container(
             height: 52,
             width: 100,
             decoration: BoxDecoration(
               color: Colors.brown[200],
               borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(10.0),
                   bottomLeft: Radius.circular(10.0)
               )
             ),

              child: Align(
               alignment: Alignment.center,
               child: Text(title),
              )
               ),
          Expanded(
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0))
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber))
                ),
              ),
          )
          )
        ]
    ),
  );

}


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
                Container(
                  width: 400.0,
                  height: 400.0,

                  decoration: BoxDecoration(
                    color: Colors.brown[100],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0)
                      )
                  ),
                  margin: const EdgeInsets.all(10.0) ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _textBoxStyle(title: "location"),
                      SizedBox(
                        height: 20.0,
                        width: 20.0,
                      ),
                      _textBoxStyle(title: "zipcode")
                    ],
                  ),
                ),

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

