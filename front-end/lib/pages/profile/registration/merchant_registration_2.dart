import 'package:flutter/material.dart';

class ContinueAccount extends StatelessWidget {
  const ContinueAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text('Merchant Registration'),
        titleTextStyle:
        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        backgroundColor: Colors.brown[700],
      ),
      body: CreateMerchantAccountBody2(),);
  }
}

class CreateMerchantAccountBody2 extends StatelessWidget {
  List<String> fields = [
    // page 2
    'Shop Name',
    'Shop Description',
    'Address',
    'City',
    'State',
    'Zip Code'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //a column with children[<widget> , text button]
      //<widget> contains padding with a child column with children[field and text]

      // page 1
      child: Column(
        children: <Widget>[
        for (int i = 0; i < fields.length; i++)
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                children: [
                  Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            fields[i].toString(),
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.brown),
                          ))),

                  TextField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 7,
                            color: Colors.deepOrange,
                          ),
                        ),
                        hintText: fields[i],
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepOrange))),
                  ),

                  const Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0)),

                ],
              )),
        TextButton(
          child: const Text(
            'Register',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          style: TextButton.styleFrom(backgroundColor: Colors.brown[700]),
          onPressed: () {
            //TODO: MERCHANT HOME
          },
        ),
      ]));
  }
}