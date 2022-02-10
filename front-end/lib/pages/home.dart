import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          children: const [
            Expanded(child: Text("Test"), flex: 2),
            Expanded(child: Text("Test"), flex: 4),
            Expanded(child: Text("Test"), flex: 6),
          ],
        ),
      ),
    );
  }
}
