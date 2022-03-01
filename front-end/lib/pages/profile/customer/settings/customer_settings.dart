import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/common.dart';
import 'package:frontend/components/input_text_box.dart';
import 'package:frontend/network/customer_service.dart' as service;
import 'package:frontend/pages/index.dart';
import 'package:frontend/utils/shared_preferences.dart';
import 'package:frontend/utils/toast.dart';



class CustomerSettingsPage extends StatefulWidget {

  var arguments;

  CustomerSettingsPage({Key? key, this.arguments}) : super(key: key);

  @override
  _CustomerSettingsPageState createState() => _CustomerSettingsPageState();
}

class _CustomerSettingsPageState extends State<CustomerSettingsPage> {

  // late List<ListTile> _optionListTiles;

  final _icons = <Icon>[
    Icon(Icons.drive_file_rename_outline),
    Icon(Icons.account_box),
    Icon(Icons.password_outlined),
    Icon(Icons.email_outlined)
  ];

  final _options = [
    "Change Nickname",
    "Change Avatar",
    "Reset Password",
    "Reset Email",
  ];

  final _nicknameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  final _nicknameFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  final _emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Personal Settings")),
      body: Center(
          child: ListView.separated(
            itemCount: _options.length,
            separatorBuilder: (context, index) => Divider(
              thickness: 1.0,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_options[index]),
                leading: _icons[index],
                onTap: _callbackFunctionGenerator(context, index)
              );
            },
          )
      ),
    );
  }


  VoidCallback _callbackFunctionGenerator(BuildContext context, int index) {
    if (index == 0) {
      return () => _showTextFiledDialog(context, index, _nicknameController, _nicknameFormKey);
    }
    else if (index == 1) {
      return () => {};
    }
    else if (index == 2) {
      return () => _showPasswordDialog(context, index, _passwordController, _passwordFormKey);
    }
    else if (index == 3) {
      return () => _showTextFiledDialog(context, index, _emailController, _emailFormKey);
    }
    else {
      return () => {};
    }

  }



  Future<void> _showPasswordDialog(BuildContext context, int index,
      TextEditingController controller, GlobalKey<FormState> formKey) async {

    Map customer = await SPUtil.getUserData();

    TextEditingController old = TextEditingController();
    TextEditingController new_temp = TextEditingController();

    int flag = 0;

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_options[index]),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Old Password"),
                  TextFormField(
                    controller: old,
                    validator: (value) {
                      if (new_temp.text.isNotEmpty && controller.text.isNotEmpty && new_temp.text == controller.text) {
                        return customer[Common.PASSWORD] == old.text ? null : "Wrong old password!";
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Text("New Password", ),
                  TextFormField(
                    controller: new_temp,
                    obscureText: true,
                    validator: (value) {
                      return new_temp.text == controller.text ? null : "Twice not same!";
                    },
                  ),
                  SizedBox(height: 10),
                  Text("Re-enter New Password"),
                  TextFormField(
                    controller: controller,
                    obscureText: true,
                    validator: (value) {
                      return controller.text == new_temp.text ? null : "Twice not same!";
                    },
                  ),
                ],
              )
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                controller.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  _updateInfo(context, Common.PASSWORD, controller).then((res) {
                    if (res == 1) {
                      SPUtil.remove("customer");
                      SPUtil.updateLoginStatus();
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(
                              builder: (context) => Index()
                          ), (route) => false);
                    }
                  });

                }
              },
              child: const Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showTextFiledDialog(BuildContext context, int index,
      TextEditingController controller, GlobalKey<FormState> formKey) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_options[index]),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: controller,
              validator: (value) {
                if (value != null) {
                  return value.trim().isNotEmpty ? null : "Can not be empty!";
                }
              },
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Submit"),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Change nickname
                  if (index == 0) {
                    _updateInfo(context, Common.NICKNAME, controller);
                  }
                  // Change Email
                  else if (index == 3) {
                    _updateInfo(context, Common.EMAIL, controller);
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }

  _updateInfo(BuildContext context, String field, TextEditingController controller) async {
    // Get customer data from global storage

    Map customer = await SPUtil.getUserData();
    // Change the filed to new value(At this point, it did not change the global
    // storage yet. It only chane this variable "customer" Map
    customer[field] = controller.text;
    var res = await service.updateCustomerInfo(customer);
    print(res);
    if (res["code"] == 200) {
      setState(() {
        SPUtil.setString("customer", json.encode(res["data"]));
      });
      controller.clear();
      Navigator.of(context).pop();
      ToastUtil.showToast("Success!");
      return 1;
    }
    else {
      controller.clear();
      Navigator.of(context).pop();
      return 0;
    }

  }

}



