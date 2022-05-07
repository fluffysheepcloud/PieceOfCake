import 'package:flutter/material.dart';
import 'package:frontend/components/common.dart';
import 'package:frontend/components/profile_block.dart';
import 'package:frontend/utils/shared_preferences.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({Key? key}) : super(key: key);

  @override
  _CustomerProfileState createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {

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
      "routes": ["/profile/customer/fav_cakes_page", "/profile/customer/fav_merchants"],
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

  _pageBuilder(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text("${customerInfo["nickName"]}'s Profile"),
        //backgroundColor: Colors.red[100],
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

                child: Container(
                  alignment: Alignment(0, 2.5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                    radius: 60.0,
                  ),
                )
            ),
            //for spacing under the avatar
            SizedBox(height: 55),
            for (int i = 0; i < profileDataMap.length; i++)
              ProfileBlock(
                profileDataMap[i]["title"],
                profileDataMap[i]["items"],
                profileDataMap[i]["routes"],
                () => setState(() {})
              ),
            SizedBox(height: 10),

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
