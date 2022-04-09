import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/network/merchant_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search');
  final List _items = [];
  var customerName; //retrieve customer name then put it in here then display
  final List _pickCard = [];

  //read in json list, split list, take single element, pass its attributes(3) into card
  //card would take in string, and img url, 3 arguments

  readJson() async {
    var m1 = await getMerchantInfoById(1);
    var m2 = await getMerchantInfoById(2);
    var m3 = await getMerchantInfoById(3);
    var p1 = await getMerchantInfoById(1);
    debugPrint(m2.toString());

    // final String response = await rootBundle.loadString('assets/mock/sample.json');
    // debugPrint(response);

    Future <dynamic> _getPick() async{
      var p1 = await getMerchantInfoById(1);
    }

    //probably make a var for a singular value (data object) varname["data"], access it through the info card
    setState(() {
      _items.add(m1["data"]);
      _items.add(m2["data"]);
      _items.add(m3["data"]);
      _pickCard.add(p1["data"]);
      debugPrint(m1["data"].toString());
    });

  }

  @override
  //when the page is loading this method is called to set the initial state
  void initState() {
    readJson();
  }

  //move search bar to browse page
  @override
  Widget build (BuildContext context){

  return Scaffold(
    backgroundColor: Colors.orange[50],
    body: SingleChildScrollView(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //banner for welcome
        Container(
            margin: EdgeInsets.only(top: 70.0) ,
            color: Colors.brown[200],
            height: 100,
            width: 1000 ,
            child: Align(
              alignment: Alignment.center,
              child: Text("welcome, " + customerName.toString(),
              style: TextStyle(fontSize: 25),)

            )
        ),

        //banner
        Container(
            padding: const EdgeInsets.all(20.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("Recommendation for you",
                  style: TextStyle(fontSize: 25),)
            )
        ),
        //Just one card for the pick
        //InfoCard("cake name","description"),

            Container(
              child:
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _pickCard.length,
                  itemBuilder: (context, index){
                    return InfoCard(_pickCard[index]["shopName"], _pickCard[index]["description"], _pickCard[index]["id"]);
                  },

            ),
            ),
        //banner
        Container(
          padding: const EdgeInsets.all(20.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("Bakers Near you",
                  style: TextStyle(fontSize: 25),)

            )
        ),
        //Cards

           ListView.builder(
               scrollDirection: Axis.vertical,
               shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _items.length,

                itemBuilder: (context, index){
                  return InfoCard(_items[index]["shopName"], _items[index]["description"], _items[index]["id"]);//new Text("hello");//InfoCard(_items[index number]);
                }
            )
        ,
      ],
    )
    )
  );
}
}
