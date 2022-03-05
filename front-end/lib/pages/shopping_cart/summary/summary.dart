import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/pages/shopping_cart/summary/summary_card.dart';

class Summary extends StatefulWidget {
  var argumenets;

  Summary({this.argumenets, Key? key}) : super(key: key);

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {

  Future<List> mockData() async {
    final String res = await rootBundle.loadString('assets/mock/shopping_cart_mock.json');
    var data = json.decode(res)["cart"] as List;
    return data;
  }
  @override
  void initState() {
    super.initState();
    print(widget.argumenets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Order Summary")),
        body: Center(
          child: FutureBuilder<List>(
            future: mockData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return _cardBuilder(snapshot);
                }
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        )
    );
  }

  Widget _cardBuilder(AsyncSnapshot snapshot) {

    var itemList = _itemCarBuilder(snapshot);

    return Container(
        color: Color.fromARGB(255, 249, 243, 235),
        child: ListView(
          padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
          children: itemList,
        )
    );
  }

  List<Widget> _itemCarBuilder(AsyncSnapshot snapshot){
    List itemInfo = snapshot.data;
    List summaryInfo = itemInfo;
    List summaryQu = widget.argumenets;

    List<Widget> list = List.generate(
      summaryInfo.length, (index) => SummaryCard(
        itemInfo[index],
        index,
        widget.argumenets ?? [])

    );

    for (var i =0; i < summaryInfo.length; i++)
      {
        if (summaryQu[i] == 0)
          {
            list.removeAt(i);
          }
      }

      //
    /*List<Widget> list = List.generate(
    summaryInfo.length, (index) => summaryQu[index] != 0
        ? SummaryCard(
          itemInfo[index],
          index,
          widget.argumenets ?? [])
    //    : summaryInfo.removeAt(index),

    );
*/

    list.add(
        Padding(
          padding: EdgeInsets.only(bottom: 25, top: 10),
          child: ElevatedButton(
              onPressed: (){
                //Navigator.pushNamed(context, "/shopping_cart/summary",arguments:quantity);
                print(widget.argumenets.toString());
              },
              child: Text("Pay")
          ),
        )
    );
    return list;
  }
}

