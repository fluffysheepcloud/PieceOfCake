import 'package:flutter/material.dart';
import 'package:frontend/pages/user/MerchantRegistrationPage2.dart';

class CreateMerchantAccount extends StatelessWidget {
  const CreateMerchantAccount({Key? key}) : super(key: key);

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
        body: CreateMerchantAccountBody1(),);
  }
}

class CreateMerchantAccountBody1 extends StatelessWidget {
  List<String> fields = [
    // page 1
    'Username',
    'Password',
    'Re-enter Password',
    'Email',
    'Phone Number'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //a column with children[<widget> , text button]
      //<widget> contains padding with a child column with children[field and text]

        // page 1
        child: Column(children: <Widget>[
          for (int i = 0; i < 5; i++)
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
                  ],
                )),
          TextButton(
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.brown[700]),
            onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContinueAccount()),
                );
            },
          ),
        ]));
  }
}
