import 'package:flutter/material.dart';

class AddCapabilityPage extends StatefulWidget {

  var arguments;

  AddCapabilityPage({this.arguments, Key? key}) : super(key: key);

  @override
  _AddCapabilityPageState createState() => _AddCapabilityPageState();
}

class _AddCapabilityPageState extends State<AddCapabilityPage> {

  final key = GlobalKey<FormState>();

  TextEditingController itemNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: key,
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
                    onPressed: () => {},
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
}
