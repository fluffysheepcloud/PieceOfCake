import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/network/merchant_service.dart';
import 'package:frontend/network/prebuilt_cake_service.dart';
import 'package:frontend/pages/cake_request_form.dart';
import 'package:frontend/pages/profile/merchant/shop_manager/shop_manager.dart';
import 'package:frontend/utils/shared_preferences.dart';
import 'dart:convert';

import 'cake_building/custom_cake_page.dart';
//when card clicked, pass id in to here, then retrieve data from that id using await getMerchantId(id passed in)

class MerchantShop extends StatelessWidget{
  final int id;
  MerchantShop(this.id, {Key? key}) : super(key: key);

  // @override
  Map<String, dynamic> merchantInfo = {};
  final int _loginStat = SPUtil.loginStatus;
  int userId = 0;


  // //get cakes of merchant
  final List _items = [
    {
      "id": 1,
      "shopName": "Sunny's Sweets",
      "description": "Rich chocolate cake with light vanilla frosting topped with coconut shavings",
    },
    {
      "id": 2,
      "shopName": "Sunny's Sweets",
      "description": "Topped with fresh strawberries, vanilla layer cake base, strawberry slices in between each layer",
    },
    {
      "id": 3,
      "shopName": "Sunny's Sweets",
      "description": "matcha cake with white chocolate frosting",
    },
  ];
  // List _items = [];
  // Future<List> _readCakes() async{
  //   var c = await getMerchantPrebuildCakes(id);
  //   _items.add(c["data"]);
  //   debugPrint(_items.toString());
  //   return _items;
  // }

  Future<Map> _loadMerchantShop() async {
    var m1 = await getMerchantInfoById(id);
    debugPrint(m1.toString());
    Map data = m1["data"];

    return data;
  }

  Future<int> _loadId() async {
    //get stat and user info
    int userId = (await SPUtil.getUserData())["id"];
    return userId;
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: Future.wait({_loadMerchantShop(), _loadId(),}), // _readCakes()}),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              for (String key in snapshot.data[0].keys) {
                merchantInfo[key] = snapshot.data[0][key] ?? "Unknown";
                userId = snapshot.data[1];
              }
              return _pageBuilder(context);
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ) ,
    );
  }
  _pageBuilder(BuildContext context)  {
    return Scaffold(
      //display shop name
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        centerTitle: true,
        //merchant name
        title: Text("${merchantInfo["shopName"]}'s shop"),
        backgroundColor: Colors.brown[200],
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
                      image: AssetImage('assets/images/85bake.jpg'),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.orange[60]
                ),
                padding: EdgeInsets.only(left : 40.0, top: 8.0),
                child: Align(alignment: Alignment.topLeft,
                  child: Text("About the Baker", style: TextStyle(fontSize: 24), ), )
            ),
            Container(
                padding: EdgeInsets.only(left : 60.0, top: 8.0, bottom: 20.0),
                child: Align(alignment: Alignment.topLeft,
                  child: Text("${merchantInfo["description"]}", style: TextStyle(fontSize: 16), ), )
            ),
            // ElevatedButton(onPressed: (){
            //   showDumbInfo();
            // }, child: Text("dsjlfkjsd")),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("${merchantInfo["street"]} ${merchantInfo["city"]}, ${merchantInfo["state"]} ${merchantInfo["zip"]}\n"
                            "${merchantInfo["phone"]}\n${merchantInfo["businessHour"]}",
                          style: TextStyle(fontSize: 15),)
                    )
                ),
                if (_loginStat == 1 && id == userId)...[
                    ElevatedButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShopManagerPage()//ProductPage(id: id,),
                          ));
                    }, child: Text("Edit Shop"))
                  ]
                  else if (_loginStat == 0)...[
                  Column(children: [
                    ElevatedButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomCakePage()//ProductPage(id: id,),
                          ));
                    }, child: Text("Build a custom cake")),
                    ElevatedButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PurelyCustomizedCake()//ProductPage(id: id,),
                          ));
                    }, child: Text("Request cake form"))
                  ],)
                ]
                else ... [
                    SizedBox(
                      height: 50,
                    )
                ]
              ],
            ),
            SizedBox(height: 5,),

          Container(
            decoration: BoxDecoration(
              color: Colors.orange[60]),
            child: Text("${merchantInfo["shopName"]}'s Cakes",
              style: TextStyle(fontSize: 25),),
          ),

            //this will display the cards
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _items.length,
                itemBuilder: (context, index){
                  return InfoCard(_items[index]["shopName"], _items[index]["description"],  _items[index]["id"]);
                }
            ),
          ],
        ),
      ),
    );
  }
  // showDumbInfo(){
  //   debugPrint(_items.toString());
  // }
}

