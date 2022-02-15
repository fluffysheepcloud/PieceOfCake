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
  var customerName; //retrieve customer name then put it in here then display

  //read in json list, split list, take single element, pass its attributes(3) into card
  //card would take in string, and img url, 3 arguments

  readJson() async {
    var m1 = await getMerchantInfoById(1);
    var m2 = await getMerchantInfoById(2);
    var m3 = await getMerchantInfoById(3);
    // final String response = await rootBundle.loadString('assets/sample.json');
    // debugPrint(response);
    // final data = await json.decode(response);
    setState(() {
      _items.add(m1["data"]);
      _items.add(m2["data"]);
      _items.add(m3["data"]);
    });
  }

  @override
  //when the page is loading this method is called to set the initial state
  void initState() {
    readJson();
  }

  @override
  Widget build (BuildContext context){
    //var _controller = TextEditingController();
  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
                }
            )
        ),
        //banner for welcome
        //banner
        Container(
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
        InfoCard("cake name","description"),
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
        Expanded(
            child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index){
                  return InfoCard(_items[index]["shopName"], _items[index]["description"]);//new Text("hello");//InfoCard(_items[index number]);
                }
            )
        ),
      ],
    )
  );
}
}
