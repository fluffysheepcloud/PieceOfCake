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
  List _items = [];


  //read in json list, split list, take single element, pass its attributes(3) into card
  //card would take in string, and img url, 3 arguments

  readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    debugPrint(response);
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  //when the page is loading this method is called to set the initial state
  void initState() {
    readJson();
  }

  @override
  Widget build (BuildContext context){

  return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      title: customSearchBar,
      automaticallyImplyLeading:  false,
      actions: [
        IconButton(
          onPressed: () {
          setState((){
            if (customIcon.icon == Icons.search){
              customIcon = const Icon(Icons.cancel);
              customSearchBar = const ListTile(
                leading: Icon (
                  Icons.search,
                  color: Colors.white,
                  size: 28,
                ),
                title: TextField (
                  decoration:  InputDecoration(
                    hintText: 'type in cake ...',
                    hintStyle: TextStyle(
                      color:  Colors.white,
                      fontSize: 18,
                      fontStyle:  FontStyle.italic,
                    ),
                    border: InputBorder.none,
                  ),
                  style:  TextStyle(color: Colors.white),
                )
          );
            }
            else{
              customIcon = const Icon(Icons.search);
              customSearchBar = const Text ('Search');
          }
        });
      },
    icon: customIcon) ,
    ],
    centerTitle: true,
  ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index){
              return InfoCard(_items[index]["title"], _items[index]["description"]);//new Text("hello");//InfoCard(_items[index number]);
            }
          )
        )
      ],
    )
  );
}

}
