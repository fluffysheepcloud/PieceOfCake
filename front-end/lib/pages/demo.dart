import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  final Map<String, Object> mockData = const {
    "merchantName": "Chubby Cookie",
    "avatarURL": "assets/images/merchant_avatar.jpg",
    "cakeURLs": [
      "assets/images/cake.jpg",
      "assets/images/cake_2.jpg",
      "assets/images/cake_3.jpg",
      "assets/images/cake_4.jpg",
      "assets/images/cake_5.jpg"
    ],
    "description": "description...description...description...description..."
                   "description...description...description...description..."
                   "description...description...description...description...",
    "price": 200
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Project Demo Use")),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cancel_order");
              },
              child: Text("Cancel Order Page")),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/received_order");
                },
                child: Text("Received Order Page")),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/build_cake");
                },
                child: Text("Build Cake")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/product_page", arguments: mockData);
              },
              child: Text("Product Page")),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/profile/merchant/shop_manager/create_cake");
                },
                child: Text("Add Prebuilt Cake")),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/cake_request_form");
                },
                child: Text("Purely Customized Cake Form")),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/edit_cake_progress_tracker");
                },
                child: Text("Edit Cake Progress Tracker")),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/pickup_appointment");
                },
                child: Text("Pickup Appointment")),
          ],
        ),
      ),
    );
  }
}
