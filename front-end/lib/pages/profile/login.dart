import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/input_text_box.dart';
import 'package:frontend/network/customer_service.dart';
import 'package:frontend/network/merchant_service.dart';
import 'package:frontend/utils/shared_preferences.dart';
import 'package:frontend/utils/toast.dart';

import '../index.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String _loginTitle = "Customer Login";
  String _loginOption = "Login as Merchant";
  int _role = 0;

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Center(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    children: <Widget>[
                      // Login Title
                      Text(
                        _loginTitle,
                        style: TextStyle(
                            fontSize: 32.0
                        ),
                      ),
                      // Input username
                      SizedBox(height: 20.0),
                      InputTextBox("Username", "Username", _username),
                      // Input password
                      InputTextBox("Password", "Password", _password, obscure: true),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(150, 50)
                        ),
                        child: Text("Login"),
                        onPressed: _login,
                      ),
                      SizedBox(height: 10),
                      TextButton(
                          onPressed: () {
                            if (_role == 0) {
                              setState(() {
                                _loginTitle = "Merchant Login";
                                _loginOption = "Login as Customer";
                                _role = 1;
                              });
                            }
                            else {
                              setState(() {
                                _loginTitle = "Customer Login";
                                _loginOption = "Login as Merchant";
                                _role = 0;
                              });
                            }
                          },
                          child: Text(_loginOption)
                      ),
                      SizedBox(height: 30),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/profile/registration_options");
                          },
                          child: Text(
                            "Sign Up?",
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ),
            )

        )
    );
  }

  _login() async {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );

      if (_username.text.isEmpty) {
        ToastUtil.showToast("Please Enter Username!");
      } else if (_password.text.isEmpty) {
        ToastUtil.showToast("Please Enter Password!");
      } else {
        _userLogin(context, _username.text, _password.text);
        // Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerProfile()));
      }
    }
  }

  _userLogin(BuildContext context, String username, String password) async {
    var res;

    // customer login
    if (_role == 0) {
      res = await customerLogin(username, password);
    }
    // merchant login
    else {
      res = await merchantLogin(username, password);
    }

    if (res["code"] == 200) {
      if (_role == 0) {
        setState(() {
          print(json.encode(res["data"]));
          SPUtil.setString("customer", json.encode(res["data"]));
        });
      }
      else {
        setState(() {
          SPUtil.setString("merchant", json.encode(res["data"]));
        });
      }

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(
              builder: (context) => Index()
          ), (route) => false);
    }
    else if (res["code"] == 401) {
      ToastUtil.showToast("Your password is wrong!");
    }
    else if (res["code"] == 404) {
      ToastUtil.showToast("Username does not exist!");
    }
  }

}
