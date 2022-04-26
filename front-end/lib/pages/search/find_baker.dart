import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/input_text_box.dart';
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

//when user hits enter, the search takes in a list of two values

class _FindBakerState extends State<FindBaker>{
  List  _items = [];
  List results = [];
  String val = '';
  TextEditingController tc = new TextEditingController();
  TextEditingController _zipcode = TextEditingController();
  TextEditingController _city = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  readJson() async {
    var m1 = await getMerchantInfoById(1);
    var m2 = await getMerchantInfoById(2);
    var m3 = await getMerchantInfoById(3);
    var m4 = await getMerchantInfoById(4);
    var m5 = await getMerchantInfoById(5);
    var m6 = await getMerchantInfoById(6);

    //final String response = await rootBundle.loadString('assets/mock/sample.json');
    //final data = await json.decode(response);
    setState(() {
      _items.add(m1["data"]);
      _items.add(m2["data"]);
      _items.add(m3["data"]);
      _items.add(m4["data"]);
      _items.add(m5["data"]);
      _items.add(m6["data"]);
    });
    debugPrint(_items.toString());
  }

  @override
  void initState(){
    readJson();
  }

  void findBaker(List query){
    String cityReq = query[0];
    String zipReq = query[1];
    debugPrint(_items.length.toString());
    for (var item in _items){
      if (item["city"].toLowerCase()== cityReq.toLowerCase() || item["zip"] == zipReq) {
        results.add(item);
        //         !results.contains(item["id"])
      }
    }
    debugPrint(results.toString());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Find a Baker Near You",
            style: TextStyle(fontSize: 25),),
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
          //backgroundColor: Colors.brown[700],
        ),

        backgroundColor: Colors.orange[50],
        body: SingleChildScrollView(
          child: Column(
            children: [
              FindBakerForm(context)
            ],
          ),
        ),
    );
  }

   Widget FindBakerForm (BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        children: [
        Container(
        width: 400.0,
        height: 272.0,

        decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0))
     ),
     margin: const EdgeInsets.all(10.0) ,
     child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
          InputTextBox("City", "city", _city),
          InputTextBox("Zipcode", "zipcode", _zipcode),
          ElevatedButton(
            //style: TextButton.styleFrom
              //(backgroundColor: Colors.brown[700]),
            onPressed: () => setState(() {
              results.clear();
              _find();
            }),
            child: Text(
              'Find Baker',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          )
     ]
     )
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
        ],

      ),

    )

    ;
  }

  _find() {
    if (_formKey.currentState!.validate()){
      List req = [ _city.text, _zipcode.text];
      // debugPrint(_city.text);
      // debugPrint(_zipcode.text);
      findBaker(req);
    }

  }
}

