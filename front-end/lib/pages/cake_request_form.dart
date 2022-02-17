import 'package:flutter/material.dart';
import 'package:frontend/components/input_text_box.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Received Order',
    home: new PurelyCustomizedCake(),
  ));
}

class PurelyCustomizedCake extends StatefulWidget {
  const PurelyCustomizedCake() : super();

  @override
  _PurelyCustomizedCakeState createState() => _PurelyCustomizedCakeState();
}

class _PurelyCustomizedCakeState extends State<PurelyCustomizedCake> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _description = TextEditingController();

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
