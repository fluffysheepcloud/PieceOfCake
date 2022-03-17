import 'package:flutter/material.dart';
import 'package:frontend/components/input_text_box.dart';

class ModifyCapabilityPage extends StatefulWidget {

  var arguments;

  ModifyCapabilityPage({this.arguments, Key? key}) : super(key: key);

  @override
  _ModifyCapabilityPageState createState() => _ModifyCapabilityPageState();
}

class _ModifyCapabilityPageState extends State<ModifyCapabilityPage> {

  TextEditingController price = TextEditingController();
  GlobalKey key = GlobalKey();

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
                  Text("${widget.arguments["name"]}"),
                  SizedBox(height: 10),
                  Text("Price", style: _titleStyle()),
                  Divider(thickness: 2),
                  TextFormField(controller: price)
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
                  onPressed: () => {}, child: Text("Save"),
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

  TextStyle _titleStyle() {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18
    );
  }

}
