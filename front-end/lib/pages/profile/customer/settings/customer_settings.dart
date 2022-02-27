import 'package:flutter/material.dart';

class CustomerSettingsPage extends StatelessWidget {

  var arguments;

  CustomerSettingsPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Settings Page..."),
      ),
    );
  }
}
