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

  late TextEditingController _username;
  late TextEditingController _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                // Login Title
                Text(
                  _login_title,
                  style: TextStyle(
                      fontSize: 32.0
                  ),
                ),
                SizedBox(height: 50.0),
                // Input username
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
                        borderSide: BorderSide(color: Colors.deepOrange))
                  ),
                ),
                SizedBox(height: 20.0),
                // Input password
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                    prefixIcon: Icon(Icons.vpn_key),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50)
                  ),
                  child: Text("Login"),
                  onPressed: () {
                    //TODO: Implement Login Verification
                  },
                ),
                SizedBox(height: 10),
                TextButton(
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
                SizedBox(height: 40),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/profile/registration_select");
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
}

