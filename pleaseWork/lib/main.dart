import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pleasework/customerRegistration.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Navigation Basics',
    home: new FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Login'),
        titleTextStyle: TextStyle (color: Colors.white),
        backgroundColor: Colors.deepOrange[900],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text('Customer Login'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomerLogin()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange[900],
              ),
            ),
            ElevatedButton(
              child: new Text('Merchant Login'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MerchantLogin()),
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
                  MaterialPageRoute(builder: (context) => CreateAccount()),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange[300],
                  onPrimary: Colors.brown[900]
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomerLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Login'),
        titleTextStyle: TextStyle (color: Colors.white,),
        backgroundColor: Colors.deepOrange[900],
      ),
      body: MerchantLoginBody(),
    );
  }
}

class CustomerLoginBody extends StatelessWidget {

  _getData() async {
    var apiUrl = Uri.parse('https://jd.itying.com/api/httpGet');
    var response = await http.get(apiUrl);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          const Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),

            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.deepOrange,
                    ),
                  ),

                  labelText: 'Username',
                  hintText: 'Enter Username',
                  prefixIcon: Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange))
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            //padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(

              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter secure password',
                prefixIcon: Icon(Icons.vpn_key),
              ),
            ),
          ),
          TextButton(
            onPressed: (){
              //TODO FORGOT PASSWORD SCREEN GOES HERE
            },

            child: Text(
              'Forgot Password',
              style: TextStyle(color: Colors.deepOrange[900], fontSize: 15),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.deepOrange[900], borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text('Login',
                style: TextStyle(color: Colors.white, fontSize: 25),

              ),
            ),
          ),
          SizedBox(
            height: 130,
          ),
        ],
      ),
    );
  }
}



class MerchantLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Merchant Login'),
        titleTextStyle: TextStyle (color: Colors.white,),
        backgroundColor: Colors.deepOrange[900],

      ),
      body: MerchantLoginBody(),
    );
  }
}

class MerchantLoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          const Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),

            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.deepOrange,
                    ),
                  ),

                  labelText: 'Username',
                  hintText: 'Enter Username',
                  prefixIcon: Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange))
              ),


            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            //padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                  prefixIcon: Icon(Icons.vpn_key),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange))
              ),
            ),
          ),
          TextButton(
            onPressed: (){
              //TODO FORGOT PASSWORD SCREEN GOES HERE
            },
            child: Text(
              'Forgot Password',
              style: TextStyle(color: Colors.deepOrange[900], fontSize: 15),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.deepOrange[900], borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          SizedBox(
            height: 130,
          ),
        ],
      ),
    );
  }
}



