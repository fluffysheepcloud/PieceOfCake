import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/common.dart';
import 'package:frontend/network/merchant_service.dart' as service;
import 'package:frontend/pages/index.dart';
import 'package:frontend/utils/shared_preferences.dart';
import 'package:frontend/utils/toast.dart';



class MerchantSettingsPage extends StatefulWidget {

  var arguments;

  MerchantSettingsPage({Key? key, this.arguments}) : super(key: key);

  @override
  _MerchantSettingsPageState createState() => _MerchantSettingsPageState();
}

class _MerchantSettingsPageState extends State<MerchantSettingsPage> {

  // late List<ListTile> _optionListTiles;

  final _icons = <Icon>[
    Icon(Icons.password_outlined),
    Icon(Icons.email_outlined),
    Icon(Icons.house_outlined)
  ];

  final _options = [
    "Change Password",
    "Change Email",
    "Change Address"
  ];

  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  final _passwordFormKey = GlobalKey<FormState>();
  final _emailFormKey = GlobalKey<FormState>();
  final _addressFormKey = GlobalKey<FormState>();

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
      return () => _showPasswordDialog(context, index, _passwordController, _passwordFormKey);
    }
    else if (index == 1) {
      return () => _showTextFiledDialog(context, index, _emailController, _emailFormKey);
    }
    else if (index == 2) {
      return () => _showAddressDialog(context, index, _addressController, _addressFormKey);
    }
    else {
      return () => {};
    }

  }

  Future<void> _showPasswordDialog(BuildContext context, int index,
      TextEditingController controller, GlobalKey<FormState> formKey) async {

    Map merchant = await SPUtil.getUserData();

    TextEditingController old = TextEditingController();
    TextEditingController new_temp = TextEditingController();

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
                          return merchant[Common.PASSWORD] == old.text ? null : "Wrong old password!";
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
                      SPUtil.remove("merchant");
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
                  // Change Email
                  if (index == 2) {
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

  Future<void> _showAddressDialog(BuildContext context, int index,
      TextEditingController controller, GlobalKey<FormState> formKey) async {
    TextEditingController new_temp = TextEditingController();

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
                    Text("Street"),
                    TextFormField(
                      controller: new_temp,
                      obscureText: true,
                      validator: (value) {
                        return new_temp.text == controller.text ? null : "Invalid Street";
                      },
                    ),
                    SizedBox(height: 10),
                    Text("City"),
                    TextFormField(
                      controller: new_temp,
                      obscureText: true,
                      validator: (value) {
                        return new_temp.text == controller.text ? null : "Invalid City";
                      },
                    ),
                    SizedBox(height: 10),
                    Text("State"),
                    TextFormField(
                      controller: controller,
                      obscureText: true,
                      validator: (value) {
                        return controller.text == new_temp.text ? null : "Invalid State";
                      },
                    ),
                    SizedBox(height: 10),
                    Text("Zip Code"),
                    TextFormField(
                      controller: controller,
                      obscureText: true,
                      validator: (value) {
                        return controller.text == new_temp.text ? null : "Invalid Zip Code";
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
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Submit"),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Change Address
                  if (index == 2) {
                    _updateInfo(context, Common.STREET, controller);
                    _updateInfo(context, Common.CITY, controller);
                    _updateInfo(context, Common.STATE, controller);
                    _updateInfo(context, Common.ZIP, controller);
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
    // Get Merchant data from global storage

    Map merchant = await SPUtil.getUserData();
    // Change the filed to new value(At this point, it did not change the global
    // storage yet. It only change this variable "merchant" Map
    merchant[field] = controller.text;
    var res = await service.updateMerchantInfo(merchant);
    print(res);
    if (res["code"] == 200) {
      setState(() {
        SPUtil.setString("merchant", json.encode(res["data"]));
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



