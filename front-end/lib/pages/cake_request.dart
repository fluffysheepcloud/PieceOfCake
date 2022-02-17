import 'package:flutter/material.dart';

class CakeRequest extends StatelessWidget {
  
  var arguments;

  CakeRequest({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Custom Cake Request Form'),
        backgroundColor: Colors.red[100],
        toolbarHeight: 50,
      ),
      body: CakeRequestBody());
  }
}

class CakeRequestBody extends StatelessWidget {

  List<String> fields = [
    'Name',
    'Email',
    'Phone Number',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // logo image
            Image.asset("assets/images/PieceOfCakeLogo.png", height: 30),

            // form description text
            Text(
              'Does this merchant not have what you desire? Ask about it!',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.brown),
            ),

            // input fields
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
                    ],
                  )
              ),

            // input field for typing a description
            TextField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 7,
                      color: Colors.deepOrange,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: 'Description',
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange))),
            ),

            // submit button
            TextButton(
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.brown[700]),
              onPressed: () {
                // TODO: send info to merchant's inbox?
              },
            ),
          ],
        ),
      ),
    );
  }
}