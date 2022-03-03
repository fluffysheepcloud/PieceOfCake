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
    Icon(Icons.house_outlined),
    Icon(Icons.drive_file_rename_outline)
  ];

  final _options = [
    "Change Password",
    "Change Email",
    "Change Address",
    "Change Shop Name"
  ];

  final _passwordFormKey = GlobalKey<FormState>();
  final _emailFormKey = GlobalKey<FormState>();
  final _addressFormKey = GlobalKey<FormState>();
  final _shopNameFormKey = GlobalKey<FormState>();

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
      return () => _showPasswordDialog(context, index, _passwordFormKey);
    }
    else if (index == 1) {
      return () => _showTextFiledDialog(context, index, _emailFormKey);
    }
    else if (index == 2) {
      return () => _showAddressDialog(context, index, _addressFormKey);
    }
    else if (index == 3) {
      return () => _showTextFiledDialog(context, index, _shopNameFormKey);
    }
    else {
      return () => {};
    }

  }

  Future<void> _showPasswordDialog(BuildContext context, int index, GlobalKey<FormState> formKey) async {

    Map merchant = await SPUtil.getUserData();

    TextEditingController old = TextEditingController();
    TextEditingController temp = TextEditingController();
    TextEditingController password = TextEditingController();


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
                        if (temp.text.isNotEmpty && password.text.isNotEmpty && temp.text == password.text) {
                          return merchant[Common.PASSWORD] == old.text ? null : "Wrong old password!";
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    Text("New Password", ),
                    TextFormField(
                      controller: temp,
                      obscureText: true,
                      validator: (value) {
                        return temp.text == password.text ? null : "Twice not same!";
                      },
                    ),
                    SizedBox(height: 10),
                    Text("Re-enter New Password"),
                    TextFormField(
                      controller: password,
                      obscureText: true,
                      validator: (value) {
                        return password.text == temp.text ? null : "Twice not same!";
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
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  _updateInfo(context, {
                    Common.PASSWORD: password
                  }).then((res) {
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

  Future<void> _showTextFiledDialog(BuildContext context, int index, GlobalKey<FormState> formKey) async {

    TextEditingController controller  = TextEditingController();

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
                  if (index == 1) {
                    _updateInfo(context,{
                      Common.EMAIL: controller
                    });
                  }
                  else if (index == 3) {
                    _updateInfo(context, {
                      Common.SHOP_NAME: controller
                    });
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showAddressDialog(BuildContext context, int index, GlobalKey<FormState> formKey) async {

    TextEditingController streetController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController stateController = TextEditingController();
    TextEditingController zipController = TextEditingController();

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
                      controller: streetController,
                      validator: (value) {
                        if (value != null) {
                          return value.trim().isNotEmpty ? null : "Invalid Street";
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    Text("City"),
                    TextFormField(
                      controller: cityController,
                      validator: (value) {
                        if (value != null) {
                          return value.trim().isNotEmpty ? null : "Invalid City";
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    Text("State"),
                    TextFormField(
                      controller: stateController,
                      validator: (value) {
                        if (value != null) {
                          return value.trim().isNotEmpty ? null : "Invalid State";
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    Text("Zip Code"),
                    TextFormField(
                      controller: zipController,
                      validator: (value) {
                        if (value != null) {
                          return value.trim().isNotEmpty ? null : "Invalid Zip Code";
                        }
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
                  _updateInfo(context, {
                    Common.STREET: streetController,
                    Common.CITY: cityController,
                    Common.STATE: stateController,
                    Common.ZIP: zipController
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }


  _updateInfo(BuildContext context, Map<String, TextEditingController> fields) async {
    // Get Merchant data from global storage

    Map merchant = await SPUtil.getUserData();
    // Change the filed to new value(At this point, it did not change the global
    // storage yet. It only change this variable "merchant" Map

    for (String key in fields.keys) {
      merchant[key] = fields[key]!.text;
    }

    var res = await service.updateMerchantInfo(merchant);
    print(res);
    if (res["code"] == 200) {
      setState(() {
        SPUtil.setString("merchant", json.encode(res["data"]));
      });

      Navigator.of(context).pop();
      ToastUtil.showToast("Success!");
      return 1;
    }
    else {
      for (String key in fields.keys) {
        fields[key]!.clear();
      }
      Navigator.of(context).pop();
      return 0;
    }

  }

}



