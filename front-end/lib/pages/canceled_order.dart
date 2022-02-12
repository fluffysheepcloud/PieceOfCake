import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Received Order',
    home: new CanceledOrder(),
  ));
}

class CanceledOrder extends StatelessWidget {
  const CanceledOrder({Key? key}) : super(key: key);

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
                          color: Colors.red[200],
                          width: 500,
                          height: 200,
                          margin: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text("Sorry,",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold,),
                                  textAlign: TextAlign.center,),
                              SizedBox(height: 10,),
                              Text("your order has been canceled.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.0),
                                textAlign: TextAlign.center,),
                            ],
                          )
                      ),
                      Container(
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: <Widget>[
                              _orderDetails("Merchant Name", "???"),
                              _orderDetails("Order Number", "???"),
                              _orderDetails("Order Date", "???")
                            ],
                          )
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _itemDetails("Vanilla Cake"),
                                _itemDetails("Chocolate Cake"),
                                _itemDetails("Subtotal:"),
                                _itemDetails("Tax:"),
                                _itemDetails("Total:")
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _priceDetails("31.56"),
                                _priceDetails("27.43"),
                                _priceDetails("58.99"),
                                _priceDetails("5.03"),
                                _priceDetails("64.02")
                              ],
                            ),
                          ],
                        ),
                      ),
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
                      child: const Text('Confirm',
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
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            )
        )
    );
}

Widget _itemDetails(String labelName){
  return
    Padding (
        padding: const EdgeInsets.symmetric( horizontal:15, vertical: 10),
        child:
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labelName,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
            )
        )
    );
}

Widget _priceDetails(String labelName){
  return
    Padding (
        padding: const EdgeInsets.symmetric( horizontal:15, vertical: 10),
        child:
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "\$ " + labelName,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
            )
        )
    );
}

