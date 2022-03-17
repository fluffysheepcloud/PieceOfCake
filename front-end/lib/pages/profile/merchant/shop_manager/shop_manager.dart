import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/common.dart';
import 'package:frontend/network/merchant_service.dart' as service;
import 'package:frontend/utils/shared_preferences.dart';
import 'package:frontend/utils/toast.dart';



class ShopManagerPage extends StatefulWidget {

  var arguments;

  ShopManagerPage({Key? key, this.arguments}) : super(key: key);

  @override
  _ShopManagerPageState createState() => _ShopManagerPageState();
}

class _ShopManagerPageState extends State<ShopManagerPage> {

  final _icons = <Icon>[
    Icon(Icons.drive_file_rename_outline),
    Icon(Icons.maps_home_work_outlined),
    Icon(Icons.access_time_outlined),
    Icon(Icons.food_bank_outlined),
    Icon(Icons.cake_outlined),
  ];

  final _options = [
    "Change Shop Name",
    "Change Shop Description",
    "Change Business Hours",
    "Your Available Ingredients",
    "View Your Cakes"
  ];

  final _shopNameFormKey = GlobalKey<FormState>();
  final _shopDescriptionFormKey = GlobalKey<FormState>();
  final _shopHoursFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shop Manager")),
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
      return () => _showTextFiledDialog(context, index, _shopNameFormKey);
    }
    else if (index == 1) {
      return () => _showTextFiledDialog(context, index, _shopDescriptionFormKey);
    }
    else if (index == 2) {
      return () => _showTextFiledDialog(context, index, _shopHoursFormKey);
    }
    else if (index == 3) {
      return () => { Navigator.pushNamed(context, "/profile/merchant/shop_manager/modify_capability") };
    }
    else if (index == 4){
      return () => {};
    }
    else if (index == 5){
      return () => {};
    }
    else {
      return () => {};
    }
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
                  return value.trim().isNotEmpty ? null : "Cannot be empty!";
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
                  if (index == 0) {
                    _updateInfo(context,{
                      Common.SHOP_NAME: controller
                    });
                  }
                  else if (index == 1) {
                    _updateInfo(context, {
                      Common.SHOP_DESCRIPTION: controller
                    });
                  }
                  else if (index == 2) {
                    _updateInfo(context,{
                      Common.SHOP_HOURS: controller
                    });
                  }
                  else if (index == 3) {
                    _updateInfo(context,{
                      Common.SHOP_HOURS: controller
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