import 'package:flutter/material.dart';
import 'package:frontend/components/input_text_box.dart';
import 'package:frontend/domain/merchant.dart';
import 'package:frontend/pages/profile/registration/merchant_registration_2.dart';

import '../../../network/merchant_service.dart';
import '../../../utils/toast.dart';

class CreateMerchantAccount extends StatefulWidget {
  const CreateMerchantAccount({Key? key}) : super(key: key);
  @override
  _CreateMerchantAccount createState() => _CreateMerchantAccount();
}

class _CreateMerchantAccount extends State<CreateMerchantAccount> {

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _rePassword = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _shopName = TextEditingController();
  TextEditingController _shopDescription = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _zipcode = TextEditingController();
  TextEditingController _businessHour = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Merchant Registration'),

      ),
      body: SingleChildScrollView(
        child: Container(
          child: CreateMerchantForm(context),
        ),
      )
    );
  }

  Widget CreateMerchantForm(BuildContext context){
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          InputTextBox("Username", "username", _username),
          InputTextBox("Password", "password", _password),
         _reenterPassword(),
          InputTextBox("Email", "Email", _email),
          InputTextBox("Phone Number", "Phone Number", _phone),
          InputTextBox("Shop Name", "Shop Name", _shopName),
          InputTextBox("Shop Description", "Shop Description", _shopDescription),
          InputTextBox("Business Hours", "Business Hours", _businessHour),
          InputTextBox("Address", "Address", _address),
          InputTextBox("City", "City", _city),
          InputTextBox("State", "State", _state),
          InputTextBox("Zip Code", "Zip Code", _zipcode),
          TextButton(
            child: const Text(
              'Register',
            ),
            onPressed: () {
              _registerMerchant();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const ContinueAccount()),
              // );
            },
          ),
        ]
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

  _registerMerchant() async{
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );

      Merchant m = Merchant(_username.text ,_password.text,
          _email.text, _phone.text, _shopName.text, _shopDescription.text,
          _businessHour.text, _address.text, _city.text, _state.text, int.parse(_zipcode.text));

      var res = await merchantRegister(m);

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

