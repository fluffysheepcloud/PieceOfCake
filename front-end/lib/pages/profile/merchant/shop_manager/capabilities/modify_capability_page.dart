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
    price.text = widget.arguments["price"].toString();
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
                  Text("${widget.arguments["title"]}", style: _titleStyle()),
                  Divider(thickness: 2),
                  Text("${widget.arguments["name"]}"),
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
                  onPressed: () => {}, child: Text("Delete"),
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
      switch (widget.arguments["title"]) {
        case "Base Size":
          var res = await updateMerchantBaseSize(widget.arguments["id"], double.parse(price.text));
          Navigator.pop(context, res["data"]["price"]);
          break;
        case "Base Color":
          updateMerchantBaseColor(int.parse(widget.arguments["id"].toString()), double.parse(price.text));
          break;
        case "Base Flavor":
          updateMerchantBaseFlavor(int.parse(widget.arguments["id"]), double.parse(price.text));
          break;
        case "Frosting Colors":
          updateMerchantFrostingColor(int.parse(widget.arguments["id"]), double.parse(price.text));
          break;
        case "Frosting Flavors":
          updateMerchantFrostingFlavor(int.parse(widget.arguments["id"]), double.parse(price.text));
          break;
        case "Toppings":
          updateMerchantTopping(int.parse(widget.arguments["id"]), double.parse(price.text));
          break;
        default:
          ToastUtil.showToast("error");
      }
    }

  }

  TextStyle _titleStyle() {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18
    );
  }

}
