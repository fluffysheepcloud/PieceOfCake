import 'package:flutter/material.dart';
import 'package:frontend/domain/customer.dart';
import 'package:frontend/network/customer_service.dart';
import 'package:frontend/components/input_text_box.dart';
import 'package:frontend/utils/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        appBar: AppBar(
          title: Text('Customer Registration'),

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
                InputTextBox("Username", "Username", _username),
                InputTextBox("Password", "Password", _password, obscure: true),
                _reenterPassword(),
                InputTextBox("Email", "Email", _email),
                InputTextBox("Phone Number", "Phone Number", _phone),
                TextButton(
                  onPressed: _registration,
                  child: Text(
                    'Register'
                  ),
                ),
              ]
          )
      )
    );
  }

  Widget _reenterPassword() {
    return Padding(
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
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 7,
                      color: Colors.deepOrange,
                    ),
                  ),
                  hintText: "Re-Enter password",
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange))
              ),
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
    );
  }

  _registration() async {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );

      Customer c = Customer(null, _username.text, _username.text ,_password.text,
          _email.text, _phone.text);

      var res = await customerRegister(c);

      if (res["code"] == 200) {
        Navigator.pushNamed(context, "/profile/registration_success");
      }
      else {
        String message = res["message"];
        if (message.contains("MySQLIntegrityConstraintViolationException")) {
          ToastUtil.showToast("The username already exist!");
        }
        else {
          ToastUtil.showToast("Unknown Error!");
        }
      }

    }
  }

}
