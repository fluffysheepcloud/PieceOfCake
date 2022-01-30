import 'package:flutter/material.dart';
import 'CustomerRegistration.dart';
import 'MerchantRegistrationPage1.dart';


class AccountRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register for an Account'),
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: Colors.deepOrange[900],
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Sign up as?",
                textAlign: TextAlign.center,
                textScaleFactor: 2
              ),

              // add spacing below text
              const Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0)),

              ElevatedButton(
                child: Text('A Customer'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateCustomerAccount()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange[900],
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),

              // add spacing between the buttons
              const Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0)),

              ElevatedButton(
                child: Text('A Merchant'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateMerchantAccount()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange[900],
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }
}