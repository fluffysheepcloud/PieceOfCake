import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/network/merchant_service.dart';

class Browse extends StatefulWidget{

  const Browse({Key? key}) : super(key: key);

  @override
  _BrowseState createState() => _BrowseState();
}

//read in json array
//copy array into _items
//if query not empty and _items.contains(query) --> add

class _BrowseState extends State<Browse>{
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
          //searchbar
          Container(
              padding: const EdgeInsets.only(bottom:5.0, left: 50.0, right: 50.0, top: 50.0),
              //instead of appbar make a textfield with icon button
              child: TextFormField(
                  controller: tc,
                //controller: _controller,
                decoration: InputDecoration(
                    labelText: 'Search',
                    //just make regular icon
                    suffixIcon: IconButton(
                      icon: customIcon, onPressed: () {
                        if (customIcon.icon == Icons.cancel){
                          debugPrint("taps");
                          //clear not working *w*
                          tc.clear();
                        }
                    },
                    )
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
                //controller: ec,
              ),
            //controller: fieldText,
          ),
              //we must set the state, if results [ ] is empty, then we do not render
              // after the search is queried, we must set the state/repaint the page
          results.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: results.length,
              itemBuilder: (context, index){
                return InfoCard(results[index]["shopName"], results[index]["description"], results[index]["id"]);//new Text("hello");//InfoCard(_items[index number]);
              }
          )
              : ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _items.length,
            itemBuilder: (context, index){
              return InfoCard(_items[index]["shopName"], _items[index]["description"],  _items[index]["id"]);//new Text("hello");//InfoCard(_items[index number]);
            },
          )
          //end searchbar
        ],
      )
      )
    );
  }
}