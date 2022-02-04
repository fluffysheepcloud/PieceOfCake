import 'package:flutter/material.dart';
import 'package:frontend/pages/user/AccountRegistration.dart';

import 'pages/user/CustomerLogin.dart';
import 'pages/user/MerchantLogin.dart';

void main() {
  runApp(MaterialApp(
    title: 'Chubby Cookie',
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.deepOrange[900],
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: Text('User Login'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange[900],
                ),
              ),
              ElevatedButton(
                child: Text('Create an Account'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountRegistrationScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange[300], onPrimary: Colors.brown[900]),
              ),
            ],
          )),
    );
  }
}
