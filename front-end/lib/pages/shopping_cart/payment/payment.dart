import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:frontend/pages/shopping_cart/payment/payment_service.dart';

class Payment extends StatefulWidget {
  var argumenets;
  
  Payment({this.argumenets, Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  PaymentMethod? paymentMethod;

  @override
  void initState() {
    super.initState();
    print(widget.argumenets);
    PaymentService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment")),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.85,
                height: 35.0,
              ),
            ),
            Text("Payment Infomation",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight:FontWeight.w600,
                    fontStyle: FontStyle.normal)),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.85,
                height: 300.0,
                child: Column(
                  children: [
                    Text(""), Text(""),
                    Text("Your subtotal:  ${widget.argumenets.toString()}",overflow: TextOverflow.ellipsis, maxLines: 1,
                      style: TextStyle(fontSize: 20.0, fontWeight:FontWeight.w500),),
                    Text(""),
                    Text("Tax Rate: 9.50%",overflow: TextOverflow.ellipsis, maxLines: 1,
                      style: TextStyle(fontSize: 20.0, fontWeight:FontWeight.w500),),
                    Text(""),
                    Text("Tax: ${(widget.argumenets * 0.095).toStringAsFixed(2)}",overflow: TextOverflow.ellipsis, maxLines: 1,
                      style: TextStyle(fontSize: 20.0, fontWeight:FontWeight.w500),),
                    Text(""),Text(""),Text(""),
                    Text("Total: ${((widget.argumenets * 0.095 + widget.argumenets).toStringAsFixed(2))}", overflow: TextOverflow.ellipsis, maxLines: 1,
                      style: TextStyle(fontSize: 25.0, fontWeight:FontWeight.w600),),
                  ],
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25, top: 10),
              child: ElevatedButton(
                  onPressed: () async{
                    paymentMethod = (await PaymentService().createPaymentMethod()) as PaymentMethod?;
                    print("paymentMethod!.id");
                    print(paymentMethod!.id);
                    //Navigator.of(context).pushNamed( "/shopping_cart/summary", arguments: quantity);
                    print("card");
                  },
                  child: Text("Pay with card",style: TextStyle(fontSize: 20.0, fontWeight:FontWeight.w500), )
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 25, top: 10),
              child: ElevatedButton(
                  onPressed: (){
                    //Navigator.of(context).pushNamed( "/shopping_cart/summary", arguments: quantity);
                    print("PayPal");
                  },
                  child: Text("PayPal", style: TextStyle(fontSize: 20.0, fontWeight:FontWeight.w500),)
              ),
            ),
          ],
        ),
      
    )
    );

  }


}

