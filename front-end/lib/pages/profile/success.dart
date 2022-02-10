import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  var arguments;

  Success({Key? key, this.arguments}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text("Success"),
            SizedBox(height: 100),
            ElevatedButton(onPressed: () { Navigator.pop(context); }, child: Text("Done"))
          ],
        ),
      ),
    );
  }
}

