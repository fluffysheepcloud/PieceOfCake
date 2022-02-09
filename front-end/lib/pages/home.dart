import 'package:flutter/material.dart';
import 'package:frontend/network/customer_service.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 100,),
          // Test
          ElevatedButton(
              onPressed: () {
                customerLogin("cspeechley0", "qdAVscm");
              },
              child: Text("Test Login")
          ),


          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/registration_select");
            },
            child: Text("Registration Selection")
          )
        ],
      ),
    );
  }
}
