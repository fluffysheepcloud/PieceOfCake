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

class _BrowseState extends State<Browse>{
  final List _items = [];
  readJson() async {
    var m1 = await getMerchantInfoById(1);
    var m2 = await getMerchantInfoById(2);
    var m3 = await getMerchantInfoById(3);

    //add all results into a initial list
    setState(() {
      _items.add(m1["data"]);
      _items.add(m2["data"]);
      _items.add(m3["data"]);

    });
  }
  @override
  void initState(){

  }


  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
          //end searchbar

        ],
      )
      )
    );
  }

}