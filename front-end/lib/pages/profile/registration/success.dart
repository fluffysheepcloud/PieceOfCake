import 'package:flutter/material.dart';
class Success extends StatelessWidget {
  var arguments;

  Success({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text("Success"),
            SizedBox(height: 100),
            ElevatedButton(
              //navigate to merchant profile, get merchant info, send id, merchantprofile/{id}?
              onPressed: () { Navigator.popUntil(context, ModalRoute.withName("/")); },
              child: Text("Done"))
          ],
        ),
      ),
    );
  }


}


