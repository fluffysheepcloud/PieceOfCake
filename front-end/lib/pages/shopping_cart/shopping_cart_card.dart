import 'package:flutter/material.dart';
class ShoppingCartCard extends StatefulWidget {
  String orderCakeID;
  String imageURL;
  double cakeSize;
  String baseColor;
  String baseFlavor;
  String frostingColor;
  String frostingFlavor;
  double price;
  int dataIndex;



  ShoppingCartCard({required this.orderCakeID, required this.imageURL,
    required this.cakeSize, required this.baseColor, required this.baseFlavor,
    required this.frostingColor, required this.frostingFlavor, required this.price,
    required this.dataIndex, Key? key})
      : super(key: key);

  //growable list (make sure dataIndex and quantity Index are the same)
  List  quantityList = List .filled(100, 1, growable: true);



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
          height: 220.0,
          child: Card(
            elevation: 5,
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: Column(
              children: [
                _shoppingCartCardTitle(),
                _pictureAndInfo(),
                Divider(thickness: 2.0, color: Colors.brown[200],),
                _price(),
                _quantity(widget.dataIndex),
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
                "Cake ID: ${widget.orderCakeID}")
        ),
      ],
    );
  }

  Widget _pictureAndInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
          child: SizedBox(
              height: 80,
              width:120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(widget.imageURL, fit: BoxFit.cover),
              )
          ),
        ),
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: SizedBox(
                height: 80,
                width: 100,
                child: Text(
                    "Cake Size: ${widget.cakeSize} '', Base color: ${widget.baseColor}, Base flavor: ${widget.baseFlavor},"
                        " Frosting Color:${widget.frostingColor}, Frosting Flavor:${widget.frostingFlavor}",

                    overflow: TextOverflow.ellipsis,
                    maxLines: 5
                ),

              ),
            )
        ),
      ],
    );
  }

  Widget _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: EdgeInsets.only(
                left: 8, top: 5),
            child: Text(
                "Unit Price: ${widget.price},"
            )
        ),
      ],
    );
  }
  Widget _quantity(int dataIndex) {
    return Card(
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 150, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _decrementButton(dataIndex),
            Text(
              '${ widget.quantityList[dataIndex]}',
              style: TextStyle(fontSize: 18.0),
            ),
            _incrementButton(dataIndex),
          ],
        ),
      ),
    );
  }
  Widget _incrementButton(int index) {
    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.black87),
      backgroundColor: Colors.white,
      onPressed: () {
        setState(() {
          widget.quantityList[index]++;
        });
      },
    );
  }

  Widget _decrementButton(int index) {
    return FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.quantityList[index]--;
            if (widget.quantityList[index] <= 0)
              {
                widget.quantityList[index] = 0;
              }
          });
        },
        child: new Icon(Icons.remove, color: Colors.black87),
        backgroundColor: Colors.white);
  }
}
