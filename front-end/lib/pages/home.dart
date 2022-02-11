import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/network/customer_service.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  //  Widget build (BuildContext context){
  //    return Scaffold(
  //
  //   );
  // }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search');
  List _items = [];


  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
    debugPrint(_items.length.toString());

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
                  style:  TextStyle(
                    color: Colors.white
                  ),
                )
            );

            }
            else{
            customIcon = const Icon(Icons.search);
            customSearchBar = const Text ('Search');
            }
            });
            },
      icon: customIcon
                ) ,
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
              return InfoCard(index: index);
  }
        )
        )

      ],
    )
  );
}

}
