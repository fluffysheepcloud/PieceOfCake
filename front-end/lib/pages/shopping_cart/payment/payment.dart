import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:frontend/pages/shopping_cart/payment/payment_service.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

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
    //PaymentService.init();
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
                    onPressed: () async {
                      double total = widget.argumenets * 1.095;
                      var request = BraintreeDropInRequest(
                          tokenizationKey: 'sandbox_5rzcjbbq_5zcr87n9bn5n849j',
                          collectDeviceData: true,
                          paypalRequest: BraintreePayPalRequest(
                            amount: total.toStringAsFixed(2),
                            displayName: 'testName',
                          ),
                          cardEnabled: true
                      );

                      BraintreeDropInResult? result =
                      await BraintreeDropIn.start(request);
                      if (result != null){
                        print(total.toString());
                        print(result.paymentMethodNonce.description);
                        print(result.paymentMethodNonce.nonce);
                        Navigator.of(context).pushNamed( "/shopping_cart");
                      }

                      //Navigator.of(context).pushNamed( "/shopping_cart/summary", arguments: quantity);
                      //print("PayPal");
                    },
                    child: Text("PAY", style: TextStyle(fontSize: 20.0, fontWeight:FontWeight.w500),)
                ),
              ),
            ],
          ),
        )
    );

  }


}