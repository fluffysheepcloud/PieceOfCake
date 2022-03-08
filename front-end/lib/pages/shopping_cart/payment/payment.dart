import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Payment extends StatefulWidget {
  var argumenets;
  
  Payment({this.argumenets, Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  @override
  void initState() {
    super.initState();
    print(widget.argumenets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment")),
      body: Center(
        child: Column(
          children: [
            Text("Payment"),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.85,
                height: 220.0,
                child: Column(
                  children: [
                    Text("Your subtotal:  ${widget.argumenets.toString()}",overflow: TextOverflow.ellipsis, maxLines: 1,),
                    Text("Tax Rate: 9.50%",overflow: TextOverflow.ellipsis, maxLines: 1,),
                    Text("Tax: ${((widget.argumenets * 0.095).toStringAsFixed(2)).toString() }",overflow: TextOverflow.ellipsis, maxLines: 1,),
                    Text("Total: ${((widget.argumenets * 0.095 +widget.argumenets).toStringAsFixed(2)).toString()}", overflow: TextOverflow.ellipsis, maxLines: 1,),
                  ],

                ),
              )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25, top: 10),
              child: ElevatedButton(
                  onPressed: (){
                    //Navigator.of(context).pushNamed( "/shopping_cart/summary", arguments: quantity);
                    print("card");
                  },
                  child: Text("Pay with card")
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 25, top: 10),
              child: ElevatedButton(
                  onPressed: (){
                    //Navigator.of(context).pushNamed( "/shopping_cart/summary", arguments: quantity);
                    print("PayPal");
                  },
                  child: Text("PayPal")
              ),
            ),
          ],
        ),
      
    )
    );



  }


}

