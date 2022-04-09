import 'package:flutter/material.dart';
import 'package:frontend/network/capability_service.dart';
import 'package:frontend/utils/shared_preferences.dart';
import 'package:frontend/utils/toast.dart';

class AddCapabilityPage extends StatefulWidget {

  var arguments;

  AddCapabilityPage({this.arguments, Key? key}) : super(key: key);

  @override
  _AddCapabilityPageState createState() => _AddCapabilityPageState();
}

class _AddCapabilityPageState extends State<AddCapabilityPage> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController itemNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  bool itemFilled = false;
  bool priceFilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.arguments["title"]}", style: _titleStyle()),
                  Divider(thickness: 2),
                  TextFormField(
                    controller: itemNameController,
                    validator: (value) {
                      if (value != null) {
                        return value.trim().isNotEmpty ? null : "Item name can not be empty!";
                      }
                    },
                    onChanged: (value) {
                      if (value.trim().isNotEmpty) {
                        itemFilled = true;
                      } else {
                        itemFilled = false;
                      }
                      setState(() {});

                    },
                  ),
                  SizedBox(height: 10),
                  Text("Price", style: _titleStyle()),
                  Divider(thickness: 2),
                  TextFormField(
                    controller: priceController,
                    validator: (value) {
                      if (value != null) {
                        return value.trim().isNotEmpty ? null : "Price can not be empty!";
                      }
                    },
                    onChanged: (value) {
                      if (value.trim().isNotEmpty) {
                        priceFilled = true;
                      } else {
                        priceFilled = false;
                      }
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 25),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: (itemFilled && priceFilled) ? _addCapability : null,
                    child: Text("Save"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        minimumSize: Size(120, 60)
                    ),
                  ),
                ]
            )
          ],
        ),
      ),
    );
  }

  TextStyle _titleStyle() {
    return TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18
    );
  }

  void _addCapability() async {

    if (_formKey.currentState!.validate()) {
      int id = (await SPUtil.getUserData())["id"];
      var res;
      switch (widget.arguments["title"]) {
        case "Base Size":
          res = await addMerchantBaseSize(id, itemNameController.text, priceController.text);
          break;
        case "Base Colors":
          res = await addMerchantBaseColor(id, itemNameController.text, priceController.text);
          break;
        case "Base Flavors":
          res = await addMerchantBaseFlavor(id, itemNameController.text, priceController.text);
          break;
        case "Frosting Colors":
          res = await addMerchantFrostingColor(id, itemNameController.text, priceController.text);
          break;
        case "Frosting Flavors":
          res = await addMerchantFrostingFlavor(id, itemNameController.text, priceController.text);
          break;
        case "Toppings":
          res = await addMerchantTopping(id, itemNameController.text, priceController.text);
          break;
        default:
          ToastUtil.showToast("error");
      }
      if (res["code"] != 200) {
        ToastUtil.showToast("error");
      }
      else {
        Navigator.pop(context, res["data"]);
      }
    }
  }

}
