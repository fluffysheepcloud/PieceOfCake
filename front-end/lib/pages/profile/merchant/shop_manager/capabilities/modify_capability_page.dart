import 'package:flutter/material.dart';
import 'package:frontend/network/capability_service.dart';
import 'package:frontend/utils/toast.dart';

class ModifyCapabilityPage extends StatefulWidget {

  var arguments;

  ModifyCapabilityPage({this.arguments, Key? key}) : super(key: key);

  @override
  _ModifyCapabilityPageState createState() => _ModifyCapabilityPageState();
}

class _ModifyCapabilityPageState extends State<ModifyCapabilityPage> {

  TextEditingController price = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isChanged = false;

  @override
  void initState() {
    super.initState();
    price.text = widget.arguments["info"]["price"].toString();
  }

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
                  Text("Name", style: _titleStyle()),
                  Divider(thickness: 2),
                  Text("${widget.arguments["info"]["name"]}"),
                  SizedBox(height: 10),
                  Text("Price", style: _titleStyle()),
                  Divider(thickness: 2),
                  TextFormField(
                    controller: price,
                    onChanged: (value) {
                      setState(() {
                        _isChanged = true;
                      });
                    },
                    validator: (value) {
                      if (value != null) {
                        return value.trim().isNotEmpty ? null : "Price can not be empty!";
                      }
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
                  onPressed: () {
                    _removeCapability();
                  },
                  child: Text("Delete"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      minimumSize: Size(120, 60)
                  ),
                ),
                // SizedBox(width: 50),
                ElevatedButton(
                  onPressed: _isChanged ? _updateCapability : null,
                  child: Text("Save"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      minimumSize: Size(120, 60)
                  ),
                ),
              ]
            )
          ],
        )
      )
    );
  }

  void _updateCapability() async {
    // Validate returns true if the form is valid, or false otherwise.

    if (_formKey.currentState!.validate()) {
      var res;
      switch (widget.arguments["title"]) {
        case "Base Size":
          res = await updateMerchantBaseSize(widget.arguments["info"]["id"], double.parse(price.text));
          break;
        case "Base Colors":
          res = await updateMerchantBaseColor(widget.arguments["info"]["id"], double.parse(price.text));
          break;
        case "Base Flavors":
          res = await updateMerchantBaseFlavor(widget.arguments["info"]["id"], double.parse(price.text));
          break;
        case "Frosting Colors":
          res = await updateMerchantFrostingColor(widget.arguments["info"]["id"], double.parse(price.text));
          break;
        case "Frosting Flavors":
          res = await updateMerchantFrostingFlavor(widget.arguments["info"]["id"], double.parse(price.text));
          break;
        case "Toppings":
          res = await updateMerchantTopping(widget.arguments["info"]["id"], double.parse(price.text));
          break;
        default:
          ToastUtil.showToast("error");
      }

      if (res["code"] != 200) {
        ToastUtil.showToast("error");
      }
      else {
        Navigator.pop(context, [0, res["data"]["price"]]);
      }
    }
  }

  void _removeCapability() async {
    var res;
    switch (widget.arguments["title"]) {
      case "Base Size":
        res = await removeMerchantBaseSize(widget.arguments["info"]["id"]);
        break;
      case "Base Colors":
        res =await removeMerchantBaseColor(widget.arguments["info"]["id"]);
        break;
      case "Base Flavors":
        res = await removeMerchantBaseFlavor(widget.arguments["info"]["id"]);
        break;
      case "Frosting Colors":
        res = await removeMerchantFrostingColor(widget.arguments["info"]["id"]);
        break;
      case "Frosting Flavors":
        res = await removeMerchantFrostingFlavor(widget.arguments["info"]["id"]);
        break;
      case "Toppings":
        res = await removeMerchantTopping(widget.arguments["info"]["id"]);
        break;
      default:
        ToastUtil.showToast("error");
    }
    if (res["code"] != 200) {
      ToastUtil.showToast("error");
    }
    else {
      Navigator.pop(context, [1, widget.arguments["info"]]);
    }
  }

  TextStyle _titleStyle() {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18
    );
  }



}
