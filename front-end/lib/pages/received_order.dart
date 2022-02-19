import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Received Order',
    home: new ReceivedOrder(),
  ));
}

class ReceivedOrder extends StatelessWidget {

  var arguments;

  ReceivedOrder({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Received Order'),
          titleTextStyle: const TextStyle (color: Colors.white, fontWeight: FontWeight.bold),
          backgroundColor: Colors.brown[700],
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.orange[50],
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.blue[400],
                    width: 500,
                    height: 100,
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: const Text("New Order",
                        style: TextStyle(color: Colors.white,
                            fontSize: 40.0))

                  ),
                  Container(
                    color: Colors.red[200],
                    width: 400,
                    height: 100,
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      children: <Widget>[
                        _orderDetails("Customer Name", "???"),
                        _orderDetails("Order Number", "???")
                      ],
                    )
                  ),
                  SizedBox(
                    width: 500,
                    child: Column(
                      children: <Widget>[
                        _cakeDetails("Base", "???"),
                        _cakeDetails("Base Color", "???"),
                        _cakeDetails("Frosting Type", "???"),
                        _cakeDetails("Frosting Color", "???"),
                        _cakeDetails("Toppings", "???"),
                        _cakeDetails("Order Note", "???")
                      ],
                    ),
                  )
                ]
              ),
            ),
            const SizedBox(height: 10,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.brown[700],
                      padding: EdgeInsets.all(15.0)),
                    onPressed: (){
                      //TODO ACCEPT MESSAGE
                    },
                    child: const Text('Accept',
                      style: TextStyle( color: Colors.white, fontSize: 25),
                    ),
                    
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.brown[700],
                        padding: EdgeInsets.all(15.0)),
                    onPressed: (){
                      //TODO REJECT MESSAGE
                    },
                    child: const Text('Reject',
                      style: TextStyle( color: Colors.white, fontSize: 25),
                    ),
                  ),
                ]
            )
          ]
        )
    );
  }
}

Widget _orderDetails(String labelName, String value){
  return
    Padding (
        padding: const EdgeInsets.symmetric( horizontal:15, vertical: 10),
        child:
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labelName + ": " + value,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )
        )
    );
}

Widget _cakeDetails(String labelName, String value){
  return
    Padding (
        padding: const EdgeInsets.symmetric( horizontal:15, vertical: 10),
        child:
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labelName + ": " + value,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            )
        )
    );
}

