import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cake Progress Tracker'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    width: 500,
                    height: 50,
                    color: Colors.orange[50],
                    child: Center(
                      child: Text('Order Number: ',
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
                      child: Text('Current Order Status: ',
                        textAlign: TextAlign.center,),
                    )),
              ),
              TimeLine(),
            ],
          )
        )
      )
    );
  }
}



class TimeLine extends StatefulWidget {
  const TimeLine({
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
    timeline = _getCards();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
          itemCount: timeline.length,
          itemBuilder: (context,index){
            return Container(
              child: Row(
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
                          color: Colors.green,
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
              )
            );
          }),
    );
  }

  List<TimelineCard> _getCards() {
    List<TimelineCard> timelineCard = [];

    timelineCard.add(TimelineCard("Order Received", "The merchant has received your order", Icons.check));
    timelineCard.add(TimelineCard("In creation", "The merchant is creating your order", Icons.check));
    timelineCard.add(TimelineCard("Ready for pick up", "Your order is ready for pick up", Icons.check));

    return timelineCard;
  }
}

class TimelineCard {
  String title;
  String description;
  IconData icon;

  TimelineCard(this.title, this.description, this.icon);
}