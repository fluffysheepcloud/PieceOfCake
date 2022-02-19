import 'package:flutter/material.dart';
import 'package:frontend/utils/shared_preferences.dart';
class MerchantProfile extends StatelessWidget {
  const MerchantProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Merchant Page")),
      body: Center(
        child: Column(
        children: [
          Text("Merchant Profile Page"),
          ElevatedButton(
            onPressed: () {
              SPUtil.remove("merchant");
              Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
            },
            child: Text("Log Out"))
        ]

        )
      ),
    );
  }
}
