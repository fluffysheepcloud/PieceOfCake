import 'package:flutter/material.dart';
import 'package:frontend/pages/cake_progress_tracker.dart';
import 'package:frontend/routes/routes.dart' as routes;


void main() {
  runApp(MaterialApp(
    title: 'Edit Cake Progress',
    home: EditCakeProgress(),
    onGenerateRoute: routes.onGeneratedRoute,
  ));
}

class EditCakeProgress extends StatefulWidget {
  var arguments;

  EditCakeProgress({Key? key, this.arguments}) : super(key: key);

  @override
  _EditCakeProgressState createState() => _EditCakeProgressState();
}

class _EditCakeProgressState extends State<EditCakeProgress> {
  String orderStatus = "Order Confirmed";
  String orderNumber = "123";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Edit Cake Progress'),
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
          backgroundColor: Colors.brown[700],
        ),
        body: customerRegisterForm(context)
    );
  }

  Widget customerRegisterForm(BuildContext context) {
    return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                width: 500,
                height: 50,
                color: Colors.orange[50],
                child: Center(
                  child: Text('Order Number: ' + orderNumber,
                    textAlign: TextAlign.center,),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                width: 500,
                height: 50,
                color: Colors.orange[50],
                child: Center(
                  child: Text('Current Order Status: ' + orderStatus,
                    textAlign: TextAlign.center,),
                )),
          ),
          TextButton(
            style: TextButton.styleFrom
              (backgroundColor: Colors.brown[700]),
            onPressed: () {
              setState(() {
                orderStatus = 'Order Confirmed';
              });
            },
            child: Text(
              'Order Confirmed',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom
              (backgroundColor: Colors.brown[700]),
            onPressed: () {
              setState(() {
                orderStatus = 'In Progress';
              });
            },
            child: Text(
              'In Progress',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom
              (backgroundColor: Colors.brown[700]),
            onPressed: () {
              setState(() {
                orderStatus = 'Cake Ready for Pickup';
              });
            },
            child: Text(
              'Cake Ready for Pickup',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom
              (backgroundColor: Colors.brown[700]),
            onPressed: () {
              setState(() {
                orderStatus = 'Order Cancelled';
              });
            },
            child: Text(
              'Cancel Order',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom
              (backgroundColor: Colors.red[700]),
            onPressed: () {
              _sentData(context);
            },
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ]
    );
  }

  Map<String, Object> _statusAsData(orderStatus, orderNumber) {
    Map<String, Object> data = {"orderStatus": orderStatus, "orderNumber": orderNumber};

    return data;
  }

  void _sentData(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CakeProgressTracker(orderNumber: orderNumber, orderStatus: orderStatus,)));
//    Navigator.pushNamed(context, "/cake_progress_tracker", arguments: _statusAsData(orderStatus, orderNumber));
  }
}

