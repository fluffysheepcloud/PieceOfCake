import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/merchant_card.dart';
import 'package:frontend/network/merchant_service.dart';
import 'package:frontend/pages/search/find_baker.dart';

class Browse extends StatefulWidget{

  const Browse({Key? key}) : super(key: key);

  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse>{
  List  _items = [];
  List results = [];
  String val = '';
  TextEditingController tc = new TextEditingController();

  readJson() async {
    var m1 = await getMerchantInfoById(1);
    var m2 = await getMerchantInfoById(2);
    var m3 = await getMerchantInfoById(3);

    setState(() {
      _items.add(m1["data"]);
      _items.add(m2["data"]);
      _items.add(m3["data"]);
    });
  }

  @override
  void initState(){
    readJson();
  }

  void filterSearch(String query){
    for (var item in _items){
      if (item["shopName"].toLowerCase().contains(query.toLowerCase()) || item["description"].toLowerCase().contains(query.toLowerCase())){
        results.add(item);
      }
    }
  }

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse for Shops'),
      ),

      body: SingleChildScrollView(
          child: Column(
            children:<Widget>[
              //searchbar
              Container(
                padding: const EdgeInsets.only(bottom:5.0, left: 50.0, right: 50.0, top: 50.0),
                //instead of appbar make a textfield with icon button
                child: TextFormField(
                  controller: tc,
                  //controller: _controller,
                  decoration: InputDecoration(
                    //just make regular icon
                    suffixIcon: IconButton(
                      color: Colors.brown,
                      icon: customIcon, onPressed: () {
                      if (customIcon.icon == Icons.cancel){
                        //debugPrint("taps");
                        tc.clear();
                      }
                    },
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 7,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown)),
                    hintText: 'Search',
                  ),

                  //if textfield tapped then turn icon into cancel, if icon button tapped and it is a cancel, then cancel transaction
                  onTap: () {
                    setState(() {
                      if (customIcon.icon == Icons.search) {
                        //results.clear();
                        customIcon = const Icon(Icons.cancel);
                        customSearchBar = const ListTile(
                          leading: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 28,
                          ),
                        );
                      }
                      else {
                        customIcon = const Icon(Icons.search);
                        //close keyboard
                        FocusScope.of(context).unfocus();
                      }
                    }
                    );
                  },
                  onFieldSubmitted: (val) {
                    //when user hits enter this method will be called
                    results.clear();
                    filterSearch(val);
                  },
                ),
              ),

              SizedBox(height: 15,),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  results.clear();
                                  filterSearch("Honney");
                                  print(results);
                                });
                              },
                              child: Text(
                                "        # Honney   ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.brown,
                                ),
                              )
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  results.clear();
                                  filterSearch("cake");
                                  print(results);
                                });
                              },
                              child: Text(
                                "# Cake   ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.brown,
                                ),
                              )
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  results.clear();
                                  filterSearch("Sweet");
                                  print(results);
                                });
                              },
                              child: Text(
                                "# Sweet   ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.brown,
                                ),
                              )
                          ),
                        ],
                      )
                    ],
                  )
              ),

              //SizedBox(height: 10,),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FindBaker() ,
                        ));
                  },
                  child: Text(
                    "Find a Baker Near You",
                  )
              ),

              results.isNotEmpty
                  ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: results.length,
                  itemBuilder: (context, index){
                    // [cake name] , [description], [cake id], [price]
                    return InfoCard(results[index]["shopName"], results[index]["description"], results[index]["id"]);
                  }
              )
                  : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _items.length,
                itemBuilder: (context, index){
                  // [cake name] , [description], [cake id], [price]
                  return InfoCard(_items[index]["shopName"], _items[index]["description"],  _items[index]["id"]);
                },
              )
              //end searchbar
            ],
          )
      ),
    );
  }
}