import 'package:flutter/material.dart';
import 'dart:io';
import 'package:frontend/components/input_text_box.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Cake Request Form',
    home: new PurelyCustomizedCake(),
  ));
}

class PurelyCustomizedCake extends StatefulWidget {
  var arguments;

  PurelyCustomizedCake({Key? key, this.arguments}) : super(key: key);

  @override
  _PurelyCustomizedCakeState createState() => _PurelyCustomizedCakeState();
}

class _PurelyCustomizedCakeState extends State<PurelyCustomizedCake> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _description = TextEditingController();

  // for selecting images
  final ImagePicker _picker = ImagePicker();
  File? image;
  List<File> multipleImages = [];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Completely Personalized Cake Request'),
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
          backgroundColor: Colors.brown[700],
        ),
        body: customerRegisterForm(context)
    );
  }

  Widget customerRegisterForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          //a column with children[<widget> , text button]
          //<widget> contains padding with a child column with children[label and textfield]
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("To order a completely personalized cake, please enter the following information."),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        color: Colors.orange[50],
                        child: InputTextBox("Name", "Name", _name)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        color: Colors.orange[50],
                        child: InputTextBox("Email", "Email", _email,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        color: Colors.orange[50],
                        child: InputTextBox("Address", "Address", _address)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        color: Colors.orange[50],
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Description",
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, color: Colors.brown),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  controller: _description,
                                  decoration: InputDecoration(
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 7,
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                      hintText: 'Enter Description',
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.deepOrange))
                                  ),
                                  obscureText: false,
                                  validator: (value) {
                                    if (value != null) {
                                      return value.trim().isNotEmpty ? null : "${"Description"} can not be empty!";
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                  ),

                  // customer photo uploading
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                          children: [
                            Divider(thickness: 1, color: Colors.brown),
                            Text("Upload up to 6 photos",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.brown)),
                            ElevatedButton(
                                style: TextButton.styleFrom
                                  (backgroundColor: Colors.brown[700]),
                                onPressed: () async {
                                  List<XFile>? picked = await _picker.pickMultiImage();
                                  setState(() {
                                    multipleImages = picked!.map((e) => File(e.path)).toList();
                                  });
                                },
                                child: const Text("Select Photos",
                                    style: TextStyle(color: Colors.white, fontSize: 15)
                                )
                            ),
                          ]
                      )

                  ),
                  Container (
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.brown,  // red as border color
                      ),
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Column(
                        children: [
                          //other widgets
                          Expanded(
                            child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                                itemCount: multipleImages.length,
                                itemBuilder: (context, index) {
                                  return GridTile(child: Image.file(multipleImages[index]));
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // spacing
                  SizedBox(height: 10),

                  TextButton(
                    style: TextButton.styleFrom
                      (backgroundColor: Colors.brown[700]),
                    onPressed: () {},
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ]
            )
        )
    );
  }
}
