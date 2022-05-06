import 'package:flutter/material.dart';
import 'package:frontend/network/prebuilt_cake_service.dart';
import 'package:frontend/utils/shared_preferences.dart';
import 'package:frontend/utils/toast.dart';

import 'package:flutter/material.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/network/merchant_service.dart';
import 'package:frontend/pages/profile/merchant/shop_manager/create_cake/add_prebuilt_cake.dart';

// page where merchant can add new cakes and edit them(?)
class CakeProductPage extends StatefulWidget{

  const CakeProductPage({Key? key}) : super(key: key);

  @override
  CakeProducts createState() => CakeProducts();
}

class CakeProducts extends State<CakeProductPage> {
  List cakes = [];

  readJson() async {
    var m1 = await getMerchantInfoById(1);

    setState(() {
      cakes.add(m1["data"]);
    });
    debugPrint(cakes.toString());
  }

  @override
  void initState(){
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cakes",
          style: TextStyle(fontSize: 25)),
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold),
        backgroundColor: Colors.brown[700],
      ),

      backgroundColor: Colors.orange[50],
      body: _cakePage()
    );
  }

  _cakePage() {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10
            ),
            TextButton(
              style: TextButton.styleFrom
                (backgroundColor: Colors.brown[700]),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPrebuiltCake()),
                );
              },
                child: const Text('Add a New Cake',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cakes.length,
                itemBuilder: (context, index){
                  return InfoCard(cakes[index]["shopName"], cakes[index]["description"], cakes[index]["id"]);
                }
            ),
          ],
        )
    );
  }
}
