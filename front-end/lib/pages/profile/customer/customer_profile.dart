import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/customer/customer_profile_block.dart';
import 'package:frontend/utils/shared_preferences.dart';

class CustomerProfile extends StatelessWidget {
  const CustomerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('[CUSTOMER]\'s Profile'),
        backgroundColor: Colors.red[100],
        toolbarHeight: 50,
      ),
      body: CustomerProfileBody(),);
  }
}

class CustomerProfileBody extends StatelessWidget {

  List<Map> profileDataMap = [
    {
      "title": "My Orders",
      "items": ["All Orders", "Reviews"]
    },
    {
      "title": "Favorite",
      "items": ["Cakes", "Merchants"]
    },
    {
      "title": "Personal Info",
      "items": ["Settings"]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              CustomerProfileBlock(profileDataMap[i]["title"], profileDataMap[i]["items"]),
            SizedBox(height: 10),

            ElevatedButton(
                onPressed: () {
                  SPUtil.remove("customer");
                  Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
                },
                child: Text("Log Out"))
          ],
        ),
      ),
    );
  }
}