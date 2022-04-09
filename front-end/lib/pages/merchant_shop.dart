import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/network/merchant_service.dart';
import 'package:frontend/utils/shared_preferences.dart';
import 'dart:convert';
//when card clicked, pass id in to here, then retrieve data from that id using await getMerchantId(id passed in)

class MerchantShop extends StatelessWidget{
  final int id;
  MerchantShop(this.id);

  // @override

  Map<String, dynamic> merchantInfo = {};
  final int _loginStat = SPUtil.loginStatus;


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

  Future<Map> _loadMerchantShop() async {
    var m1 = await getMerchantInfoById(id);
    debugPrint(m1.toString());
    Map data = m1["data"];

    debugPrint(data.toString());

    return data;
  }

  // void initState(){
  //   readJson();
  // }
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
  //TEMPORARY LOG IN STATE BUTTON FOR NOW BC NOT CONNECTED TO DB :(
  //int log1 = 1;
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
            SizedBox(height: 20,),
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
                //refer to registration/profile.dart for inspo
                //will need to refine this so it checks that the login state is not 0 and the ID's match
                _loginStat == 0 ?
                ElevatedButton(onPressed: (){}, child: Text("Build a custom cake")) : ElevatedButton(onPressed: (){}, child: Text("Edit Shop"))
              ],
            ),
            SizedBox(height: 5,),
            Container(
                padding: EdgeInsets.only(left : 40.0, top: 8.0),
                child: Align(alignment: Alignment.topLeft,
                  child: Text("About the Baker", style: TextStyle(fontSize: 24), ), )
            ),
            Container(
              padding: EdgeInsets.only(left : 60.0, top: 8.0, bottom: 20.0),
              child: Align(alignment: Alignment.topLeft,
              child: Text("${merchantInfo["description"]}", style: TextStyle(fontSize: 16), ), )
            ),

            Text("${merchantInfo["shopName"]}'s Cakes",
              style: TextStyle(fontSize: 25),),
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
}

