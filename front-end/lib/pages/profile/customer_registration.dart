import 'package:flutter/material.dart';
import 'package:frontend/domain/customer.dart';

class CreateCustomerAccount extends StatefulWidget {
  const CreateCustomerAccount({Key? key}) : super(key: key);

  @override
  _CreateCustomerAccountState createState() => _CreateCustomerAccountState();
}

class _CreateCustomerAccountState extends State<CreateCustomerAccount> {


  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _rePassword = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
          title: Text('Customer Registration'),
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
          backgroundColor: Colors.brown[700],
        ),
        body: customerRegisterForm(context)
    );
  }

  Widget customerRegisterForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        //a column with children[<widget> , text button]
        //<widget> contains padding with a child column with children[label and textfield]
          child: Column(
              children: <Widget>[
                _inputText("Username", "Username", _username),
                _inputText("Password", "Password", _password, obscure: true),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Re-enter Password",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.brown),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _rePassword,
                          decoration: _generateInputDecoration("Re-enter Password"),
                          obscureText: true,
                          validator: (value) {
                            if (value != null) {
                              return value.trim().isNotEmpty ?
                              (value == _password.text ? null : "Password does not match") :
                                  "Cannot be empty";
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
                _inputText("Email", "Email", _email),
                _inputText("Phone Number", "Phone Number", _phone),
                TextButton(
                  style: TextButton.styleFrom
                    (backgroundColor: Colors.brown[700]),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );

                      Customer c = Customer(_username.text, _password.text,
                          _email.text, _phone.text);


                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ]
          )
      )
    );
  }

  _generateInputDecoration(String hintText) {
    return InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 7,
            color: Colors.deepOrange,
          ),
        ),
        hintText: 'Enter ' + hintText,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange))
    );
  }

  Widget _inputText(String labelName, String hintText, TextEditingController controller, {obscure = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              labelName,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: controller,
              decoration: _generateInputDecoration(hintText),
              obscureText: obscure,
              validator: (value) {
                if (value != null) {
                  return value.trim().isNotEmpty ? null : "${labelName} can not be empty!";
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
