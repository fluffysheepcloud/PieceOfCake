import 'dart:convert';

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
  List  list0 = [];
  TextEditingController editingController = TextEditingController();

  Future<void> readJson() async {

    final String response = await rootBundle.loadString('assets/mock/sample.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });

  }


  @override
  void initState(){
    readJson();
    //debugPrint(_items.toString());
  }



  void filterSearch(String query){
    List results = [];
    debugPrint(_items.length.toString());

      for (var item in _items){
        debugPrint(item.toString());
          if (item["shopName"].contains(query) || item["description"]){
            debugPrint("pain");
          }
      }
      // for (int i = 0; i < _items.length; i ++){
      //
      //   if (_items[i]["shopName"].contains(query) || _items[i]["description"]){
      //
      //
      //   }
      // }


    // List <Map <String, dynamic>> list1 = [];
    //
    // list1.addAll(_items);
    // debugPrint("list 1 " + list1.length.toString());
    //
    // if(query.isNotEmpty){
    //   List <Map <String, dynamic>> list2 = [];
    //   list1.asMap().forEach((index, item){
    //
    //     //if shopname or description
    //     if(list0[index]["shopName"].contains(query) || list0[index]["description"])
    //     {
    //       list2.add(item);
    //       debugPrint(list2.length.toString());
    //     }
    //
    //   });
    //   setState(() {
    //     debugPrint(list2.length.toString());
    //     list0.clear();
    //     list0.addAll(list2);
    //   });
    //   return;
    // }
    // else{
    //   setState(() {
    //     list0.clear();
    //     list0.addAll(_items);
    //   });
    // }


  }


  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        children:<Widget>[
          //searchbar

          Container(
              padding: const EdgeInsets.all(50.0),
              //instead of appbar make a textfield with icon button
              child: TextFormField(
                //controller: _controller,
                decoration: InputDecoration(
                    labelText: 'Search',
                    //just make regular icon
                    suffixIcon: IconButton(
                      icon: customIcon, onPressed: () {  },
                    )
                ),

                //if textfield tapped then turn icon into cancel, if icon button tapped and it is a cancel, then cancel transaction
                onTap: () {
                  setState(() {
                    if (customIcon.icon == Icons.search) {
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
                onFieldSubmitted: (value) {
                  /// call filter function here
                  debugPrint(value.toString());
                  filterSearch(value);
                },
                controller: editingController,
              )
          ),

              ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _items.length,
              itemBuilder: (context, index){
                return InfoCard("1", "2");
                //return InfoCard(_items[index]["shopName"], _items[index]["description"]);//new Text("hello");//InfoCard(_items[index number]);
              }
          )

          //end searchbar

        ],
      )
      )
    );
  }

}