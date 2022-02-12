import 'package:flutter/material.dart';
import 'package:frontend/network/customer_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/pages/profile/customer_profile.dart';

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50.0),
                    // Login Title
                    Text(
                      _loginTitle,
                      style: TextStyle(
                          fontSize: 32.0
                      ),
                    ),
                    SizedBox(height: 50.0),
                    // Input username
                    TextField(
                      decoration: _generateInputDecoration("Username", "Enter Username", Icon(Icons.person)),
                      onChanged: (value) {
                        _username.text = value;
                      },
                    ),
                    SizedBox(height: 20.0),
                    // Input password
                    TextField(
                      obscureText: true,
                      decoration: _generateInputDecoration("Password", "Enter Password", Icon(Icons.password)),
                      onChanged: (value) {
                        _password.text = value;
                      },
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50)
                      ),
                      child: Text("Login"),
                      onPressed: () {
                        if (_username.text.isEmpty) {
                          _showToast("Please Enter Username!");
                        } else if (_password.text.isEmpty) {
                          _showToast("Please Enter Password!");
                        } else {
                          _customerLogin(context, _username.text, _password.text);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerProfile()));
                        }
                      },
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
                    SizedBox(height: 40),
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
            )

        )
    );
  }

  InputDecoration _generateInputDecoration(String labelText, String hintText, Icon icon) {
    return InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.deepOrange,
          ),
        ),
        labelText: labelText,
        hintText: hintText,
        prefixIcon: icon,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange))
    );
  }

  _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.transparent,
        textColor: Colors.grey,
        fontSize: 16.0
    );
  }

  _customerLogin(BuildContext context, String username, String password) async {
    var res = await customerLogin(username, password);
    if (res["code"] == 200) {
      // TODO: search how to save login status in local
      Navigator.pushNamed(context, "/profile/login_success");
    }
    else if (res["code"] == 401) {
      _showToast("Your password is wrong!");
    }
    else if (res["code"] == 404) {
      _showToast("Username does not exist!");
    }
  }

}
