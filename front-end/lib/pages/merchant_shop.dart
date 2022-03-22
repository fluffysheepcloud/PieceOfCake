import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/common.dart';
import 'package:frontend/components/profile_block.dart';
import 'package:frontend/components/card.dart';

import 'package:frontend/utils/shared_preferences.dart';

class MerchantShop extends StatefulWidget{

  const MerchantShop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

//read in json array
//copy array into _items
//if query not empty and _items.contains(query) --> add

class _ShopState extends State<MerchantShop>{
  Map<String, dynamic> merchantInfo = {};
  final List _items = [
    {
      "shopName": "pppoopoo",
      "description": "cries in spanish",
    },
    {
      "shopName": "pppoopoo",
      "description": "cries in spanish",
    },
    {
      "shopName": "pppoopoo",
      "description": "cries in spanish",
    },
  ];
  Future<Map> _loadMerchantShop() async {
    Map data = await SPUtil.getUserData();
    return data;
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Map>(
      future: _loadMerchantShop(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            for (String key in snapshot.data.keys) {
              merchantInfo[key] = snapshot.data[key] ?? "Unknown";
            }
            return _pageBuilder(context);
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
  //TEMPORARY LOG IN STATE BUTTON FOR NOW BC NOT CONNECED TO DB :(
  int log1 = 1;
  @override
  _pageBuilder (BuildContext context) {
    return Scaffold(
      //display shop name
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        centerTitle: true,
        //merchant name
        title: Text("${merchantInfo["shopName"]}'s Shop"),
        backgroundColor: Colors.red[100],
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // for box background
            Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://i.ibb.co/yR6jPj5/FETH-official-art.jpg'),
                        fit: BoxFit.cover
                    )
                ),
            ),
            SizedBox(height: 20,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Container(
                   child: Align(
                       alignment: Alignment.topLeft,
                       child: Text("address\nphone number\nbusiness hours",
                         style: TextStyle(fontSize: 15),)
                   )
               ),
               //if user is merchant return button, otherwise return an empty box
               //refer to registration/profile.dart for inspo
               //TEMPORARY LOG IN BUTTON CHANGE TO CONNECT TO DB
               log1 == 1 ?
                   Container(
                       child: ElevatedButton(onPressed: (){}, child: Text("Edit shop"))
                   )
               :
                Container(child: ElevatedButton(onPressed: (){}, child: Text("Build a custom cake")),)
             ],
           ),
            SizedBox(height: 20,),
            Container(
              child: Text("${merchantInfo['shopName']}'s Cakes",
                      style: TextStyle(fontSize: 25),),
            ),
            //InfoCard("Something", "something"),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _items.length,
                itemBuilder: (context, index){
                return InfoCard(_items[index]["shopName"], _items[index]["description"]);
            }
            ),

            ElevatedButton(
                onPressed: () {
                  SPUtil.remove(Common.CUSTOMER);
                  SPUtil.updateLoginStatus();
                  Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false, arguments: 2);
                },
                child: Text("Log Out"))
          ],
        ),
      ),
    );
  }
}