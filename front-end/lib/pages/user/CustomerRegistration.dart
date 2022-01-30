import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: CreateAccount(),
  ));
}

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
          title: Text('Customer Registration'),
          titleTextStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          backgroundColor: Colors.brown[700],
        ),
        body: CreateAccountBody());
  }
}

class CreateAccountBody extends StatelessWidget {
  List<String> labels = [
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
        //<widget> contains padding with a child column with children[label and textfield]

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
                          labels[i].toString(),
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
                      hintText: 'Enter ' + labels[i],
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange))),
                ),
              ],
            )),
      TextButton(
        child: Text(
          'Register',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        style: TextButton.styleFrom(backgroundColor: Colors.brown[700]),
        onPressed: () {
          //TODO: CUSTOMER HOME
        },
      ),
    ]));
  }
}
