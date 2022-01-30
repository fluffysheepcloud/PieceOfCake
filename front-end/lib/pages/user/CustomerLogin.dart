import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomerLogin extends StatelessWidget {
  const CustomerLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Login'),
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
        backgroundColor: Colors.deepOrange[900],
      ),
      body: CustomerLoginBody(),
    );
  }
}

class CustomerLoginBody extends StatelessWidget {
  const CustomerLoginBody({Key? key}) : super(key: key);

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
                      borderSide: BorderSide(color: Colors.deepOrange))),
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
            onPressed: () {
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
                color: Colors.deepOrange[900],
                borderRadius: BorderRadius.circular(20)),
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
