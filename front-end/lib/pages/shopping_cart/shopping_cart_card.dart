import 'package:flutter/material.dart';
import 'package:frontend/utils/shared_preferences.dart';
class ShoppingCartCard extends StatefulWidget {

  Map arguments;
  int index;
  List<int> quantity;

  ShoppingCartCard(this.arguments, this.index, this.quantity, {Key? key}) : super(key: key);

  @override
  _ShoppingCartCardState createState() => _ShoppingCartCardState();
}

class _ShoppingCartCardState extends State<ShoppingCartCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.85,
          height: 240.0,
          child: Card(
            elevation: 5,
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5, top: 5),
                  child: Text("Cake ID: ${widget.arguments["orderCakeID"]}"),
                ),
                 _shoppingCartCardTitle(),
                _pictureAndInfo(),
                Divider(thickness: 2.0, color: Colors.brown[200],),
                _price(),
                _quantity(widget.index),
              ],
            ),),
        ),
    );
  }
  Widget _shoppingCartCardTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: EdgeInsets.only(
                left: 8, top: 5),
            child: Text(
              "Name: ${widget.arguments["cakeName"]}",
                overflow: TextOverflow.ellipsis,
            )
        ),
      ],
    );
  }

  Widget _pictureAndInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
          child: SizedBox(
              height: 80,
              width:120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(widget.arguments["imageURL"], fit: BoxFit.cover),
              )
          ),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Column(
                children: [
                  Text("${widget.arguments["cakeName"]}", overflow: TextOverflow.ellipsis, maxLines: 1),
                  Text("Cake Size: ${widget.arguments["baseSize"]}",overflow: TextOverflow.ellipsis, maxLines: 1,),
                ],
        ),
            )
    )],
    );
  }

  Widget _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8, top: 0),
          child: Text(
            "Unit Price: ${widget.arguments["price"]}"
          )
        ),
      ],
    );
  }
  Widget _quantity(int dataIndex) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(width: 150),
          _decrementButton(dataIndex),

          Text(
            '${ widget.quantity[dataIndex]}',
            //style: TextStyle(fontSize: 18.0),
          ),
          _incrementButton(dataIndex)
        ],
      ),
    );
  }
  Widget _incrementButton(int index) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).secondaryHeaderColor,
        shape: CircleBorder()
      ),
      child: Icon(Icons.add, color: Colors.black87),
      onPressed: () async {
        await SPUtil.incrementCake(widget.arguments["id"]);
        widget.quantity[index]++;
        setState(() {});
      },
    );
  }

  Widget _decrementButton(int index)  {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
       primary: Theme.of(context).secondaryHeaderColor,
        shape: CircleBorder()
      ),

      onPressed: () async {
        await SPUtil.subtractCake(widget.arguments["id"]);
        if (widget.quantity[index] > 1) {
        widget.quantity[index]--;
        }
        setState(() {});
      },
      child: new Icon(Icons.remove, color: Colors.black87),
    );
  }
}

