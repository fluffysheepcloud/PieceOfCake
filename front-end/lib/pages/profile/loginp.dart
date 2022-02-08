import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String _login_title = "Customer Login";
  String _login_option = "Login as Merchant";
  int _role = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Container(
          width: 400.0,
          child: Column(
            children: <Widget>[
              SizedBox(height: 100.0),
              Text(_login_title),
              SizedBox(height: 100.0),
              TextField(
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
              SizedBox(height: 80.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                  prefixIcon: Icon(Icons.vpn_key),
                ),
              ),
              SizedBox(height: 80),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50)
                ),
                child: Text("Login"),
                onPressed: () {
                  //TODO: Implement Login Verification
                },
              ),
              Padding(
                // TODO: Try to find another way to do adjust the text button
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: TextButton(
                    onPressed: (){
                      if (_role == 0) {
                        setState(() {
                          _login_title = "Merchant Login";
                          _login_option = "Login as Customer";
                          _role = 1;
                        });
                      }
                      else {
                        setState(() {
                          _login_title = "Customer Login";
                          _login_option = "Login as Merchant";
                          _role = 0;
                        });
                      }
                    },
                    child: Text(_login_option)
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/profile/registration_select");
                },
                child: Text("Sign Up")
              )
            ],
          ),
        )
      )
    );
  }
}

