import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String _login_title = "Customer Login";
  String _login = "Login as Merchant";
  int _flag = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_login_title),
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
          backgroundColor: Colors.deepOrange[900],
        ),
        body: SingleChildScrollView(
          child: Column(
            children:<Widget> [
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
                      labelText: "User Name",
                      hintText: 'Enter User Password',
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
                    labelText: "User Password",
                    hintText: 'Enter User Password',
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
                    _login_title,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),

              TextButton(
                child: Text(_login,
                  style: TextStyle(color: Colors.deepOrange[900], fontSize: 15)
                ),
                onPressed: () {
                  if (_flag == 0) {
                    setState(() {
                      _login_title = "Merchant Login";
                      _login = "Login as Customer";
                      _flag = 1;
                    });
                  }
                  else {
                    setState(() {
                      _login_title = "Customer Login";
                      _login = "Login as Merchant";
                      _flag = 0;
                    });
                  }
                },
              ),
            ],
          ),
        )
    );
  }
}