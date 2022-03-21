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
  Map<String, dynamic> customerInfo = {};

  List<Map> profileDataMap = [
    {
      "title": "My Orders",
      "items": ["All Orders", "Reviews"],
      "routes": ["/profile/customer/customer_all_orders", "/profile/customer/customer_reviews"],
    },
    {
      "title": "Favorite",
      "items": ["Cakes", "Merchants"],
      "routes": ["/profile/customer/fav_cakes", "/profile/customer/fav_merchants"],
    },
    {
      "title": "Personal Info",
      "items": ["Settings"],
      "routes": ["/profile/customer/customer_settings"],
    }
  ];

  Future<Map> _loadCustomer() async {
    Map data = await SPUtil.getUserData();
    return data;
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Map>(
      future: _loadCustomer(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            for (String key in snapshot.data.keys) {
              customerInfo[key] = snapshot.data[key] ?? "Unknown";
            }
            return _pageBuilder(context);
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  @override
  _pageBuilder (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text("${customerInfo["nickName"]}'s Profile"),
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

           Row(
             children: [
               Container(
                   child: Align(
                       alignment: Alignment.center,
                       child: Text("${customerInfo["nickName"]}'s Shop",
                         style: TextStyle(fontSize: 25),)

                   )
               ),
               ElevatedButton(onPressed: (){}, child: Text("Edit shop"))
             ],
           ),
            Row(
              children: [
                Container(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("address and things",
                          style: TextStyle(fontSize: 25),)

                    )
                ),
                //the icons
                Text("icons and things")
              ],
            ),
            
            InfoCard("Something", "something"),

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