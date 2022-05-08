import 'package:flutter/material.dart';
import 'package:frontend/components/prebuilt_card.dart';
import 'package:frontend/network/prebuilt_cake_service.dart';
import 'package:frontend/network/merchant_service.dart';
import 'package:frontend/pages/profile/merchant/shop_manager/create_cake/add_prebuilt_cake.dart';

// page where merchant can add new cakes
class CakeProductPage extends StatelessWidget{

  const CakeProductPage({Key? key}) : super(key: key);

  Future<Map> _loadCakePage() async {
    Map data = {};
    data["merchantInfo"] = (await getMerchantInfoById(1))["data"];
    data["prebuildCake"] = (await getMerchantPrebuildCakes(1));

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _loadCakePage(), //_loadId()}), // _readCakes()}),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              // make sure the map is not null
              if (snapshot.hasData) {
                return _pageBuilder(context, snapshot);
              }
              else {
                return Text("Error: fail to request data");
              }
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ) ,
    );
  }

  Widget _pageBuilder(BuildContext context, AsyncSnapshot snapshot)  {
    Map merchantInfo = snapshot.data["merchantInfo"];
    Map prebuildCakes = snapshot.data["prebuildCake"];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Your Cakes"),
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10
            ),
            ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddPrebuiltCake()),
              );
            },
              child: const Text('Add a New Cake',)
                 // style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
            ),
            //this will display the cards
            prebuildCakes["data"].isNotEmpty?
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: prebuildCakes.length,
                itemBuilder: (context, index){
                  return PrebuiltCard(
                      "assets/images/cake_4.jpg",
                      prebuildCakes["data"][index],
                      merchantInfo["shopName"]
                  );
                }
            ):
            SizedBox(height: 100,
              child: Text("You don't have any cakes! Add one!"),
            ),

            SizedBox(
                height: 10
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPrebuiltCake()),
                  );
                },
                child: const Text('Add a New Cake',)
              // style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
            ),
          ],
        ),
      ),
    );
  }
}