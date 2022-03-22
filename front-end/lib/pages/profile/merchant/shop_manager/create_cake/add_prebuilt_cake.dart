import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/input_text_box.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'add_prebuilt_cake_2.dart';


// cake name, cake description, cake price, cake quantity on this page
class AddPrebuiltCake extends StatefulWidget {
  var arguments;

  AddPrebuiltCake({Key? key, required this.arguments}) : super(key: key);

  @override
  _AddPrebuiltCakeState createState() => _AddPrebuiltCakeState();
}

class _AddPrebuiltCakeState extends State<AddPrebuiltCake> {
  final TextEditingController _cake_name = TextEditingController();
  final TextEditingController _cake_description = TextEditingController();
  final CurrencyTextInputFormatter _cake_price = CurrencyTextInputFormatter();
  final TextEditingController _cake_quantity = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Add a New Prebuilt Cake'),
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
          backgroundColor: Colors.brown[700],
        ),
        body: buildCake(context),
    );
  }

  _getEnteredItems() {
    var route = MaterialPageRoute(builder: (BuildContext context) =>
        AddPrebuiltCake2(cakeName: _cake_name.text, cakeDescription: _cake_description.text,
          cakePrice: _cake_price.getUnformattedValue().toDouble(), cakeQuantity: int.parse(_cake_quantity.text)));

    Navigator.of(context).push(route);
  }

  Widget buildCake(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // enter cake name
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                  color: Colors.orange[50],
                  child: InputTextBox("Cake Name", "the name of your cake", _cake_name)
              ),
            ),

            // enter description of cake
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
                            "Cake Description",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.brown),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            controller: _cake_description,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 7,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                hintText: 'Enter the description of your cake',
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepOrange))
                            ),
                            obscureText: false,
                            validator: (value) {
                              if (value != null) {
                                return value.trim().isNotEmpty ? null : "${"Cake Description"} cannot be empty!";
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
              ),
            ),

            // enter cake price
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.orange[50],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    "Cake Price",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.brown),
                    ),

                    TextFormField(
                      initialValue: _cake_price.format('2000'),
                      inputFormatters: <TextInputFormatter>[_cake_price],
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),

            // enter quantity of cakes
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.orange[50],
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cake Quantity",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.brown),
                      ),

                      TextField(
                        controller: _cake_quantity,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered
                      ),
                    ],
                  )
              ),
            ),

            // Next leads to photo uploading and tags
            TextButton(
              style: TextButton.styleFrom
                (backgroundColor: Colors.brown[700]),
              onPressed: _getEnteredItems,
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );

  }
}