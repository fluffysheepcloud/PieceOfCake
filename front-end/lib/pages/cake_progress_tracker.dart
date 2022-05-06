import 'package:flutter/material.dart';

class CakeProgressTracker extends StatefulWidget {
  String orderStatus, orderNumber;

  CakeProgressTracker({required this.orderStatus, required this.orderNumber, Key? key}) : super(key: key);

  @override
  State<CakeProgressTracker> createState() => _CakeProgressTrackerState();
}

class _CakeProgressTrackerState extends State<CakeProgressTracker> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Cake Progress Tracker'),
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
          backgroundColor: Colors.brown[700],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      width: 500,
                      height: 50,
                      color: Colors.orange[50],
                      child: Center(
                        child: Text('Order Number: ' + widget.orderNumber,
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
                        child: Text('Current Order Status: ' + widget.orderStatus,
                          textAlign: TextAlign.center,),
                      )),
                ),
                TimeLine(orderStatus: widget.orderStatus, orderNumber: widget.orderNumber,),
              ],
            )
          ),
        )
      )
    );
  }
}



class TimeLine extends StatefulWidget {

  String orderStatus, orderNumber;

  TimeLine({
    required this.orderStatus,
    required this.orderNumber,
    Key? key,
  }) : super(key: key);

  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  List<TimelineCard> timeline = [];

  @override
  void initState() {
    super.initState();
    timeline = _getCards(widget.orderStatus);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView.builder(
          itemCount: timeline.length,
          itemBuilder: (context,index){
            return Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: 2,
                      height: 25,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: timeline[index].color,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Icon(timeline[index].icon, color: Colors.white, size: 70,),
                    ),
                    SizedBox(
                      width: 2,
                      height: 25,
                    ),
                  ],
                ),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [BoxShadow(
                            blurRadius: 10,
                            color: Colors.black
                          )]
                        ),
                        height: 100,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(timeline[index].title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            Text(timeline[index].description, style: TextStyle(fontSize: 16,),)
                          ],
                        )
                    )
                )
              ],
            );
          }),
    );
  }

  List<TimelineCard> _getCards(String status) {
    List<TimelineCard> timelineCard = [];

    if(status == "Order Cancelled") {
      timelineCard.add(TimelineCard(
          "Order Received", "The merchant has received your order",
          Icons.not_interested, Colors.red));
      timelineCard.add(TimelineCard(
          "In creation", "The merchant is creating your order",
          Icons.not_interested, Colors.red));
      timelineCard.add(TimelineCard(
          "Ready for pick up", "Your order is ready for pick up",
          Icons.not_interested, Colors.red));
    } else if(status == "Order Confirmed") {
      timelineCard.add(TimelineCard(
          "Order Received", "The merchant has received your order",
          Icons.check, Colors.green));
      timelineCard.add(TimelineCard(
          "In creation", "The merchant is creating your order",
          Icons.not_interested, Colors.red));
      timelineCard.add(TimelineCard(
          "Ready for pick up", "Your order is ready for pick up",
          Icons.not_interested, Colors.red));
    } else if(status == "In Progress") {
      timelineCard.add(TimelineCard(
          "Order Received", "The merchant has received your order",
          Icons.check, Colors.green));
      timelineCard.add(TimelineCard(
          "In creation", "The merchant is creating your order",
          Icons.check, Colors.green));
      timelineCard.add(TimelineCard(
          "Ready for pick up", "Your order is ready for pick up",
          Icons.not_interested, Colors.red));
    } else if(status == "Cake Ready for Pickup") {
      timelineCard.add(TimelineCard(
          "Order Received", "The merchant has received your order",
          Icons.check, Colors.green));
      timelineCard.add(TimelineCard(
          "In creation", "The merchant is creating your order",
          Icons.check, Colors.green));
      timelineCard.add(TimelineCard(
          "Ready for pick up", "Your order is ready for pick up",
          Icons.check, Colors.green));
    }

    return timelineCard;
  }
}

class TimelineCard {
  String title;
  String description;
  IconData icon;
  Color color;

  TimelineCard(this.title, this.description, this.icon, this.color);
}