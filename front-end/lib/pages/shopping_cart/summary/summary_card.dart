import 'package:flutter/material.dart';
class SummaryCard extends StatefulWidget {

  Map areguments;
  int index;
  List<int> quantity;

  SummaryCard(this.areguments, this.index, this.quantity, {Key? key}) : super(key: key);

  @override
  _SummaryCardState createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCard> {
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Text("Cake ID: ${widget.areguments["orderCakeID"]}"),
              ),
              // _shoppingCartCardTitle(),
              _pictureAndInfo(),
              Divider(thickness: 2.0, color: Colors.brown[200],),
              _price(),

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
              "Name: ${widget.areguments["cakeName"]}",
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
                child: Image.asset(widget.areguments["imageURL"], fit: BoxFit.cover),
              )
          ),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Column(
                children: [
                  Text("${widget.areguments["cakeName"]}", overflow: TextOverflow.ellipsis, maxLines: 1),
                  Text("Cake Size: ${widget.areguments["cakeSize"]}",overflow: TextOverflow.ellipsis, maxLines: 1,),
                  Text("Base color: ${widget.areguments["baseColor"]}",overflow: TextOverflow.ellipsis, maxLines: 1,),
                  Text("Base flavor: ${widget.areguments["baseFlavor"]} ",overflow: TextOverflow.ellipsis, maxLines: 1,),
                  Text("Frosting Color:${widget.areguments["frostingColor"]} ",overflow: TextOverflow.ellipsis, maxLines: 1,),
                  Text("Frosting Flavor:${widget.areguments["frostingFlavor"]}",overflow: TextOverflow.ellipsis, maxLines: 1,),
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
                "Unit Price: ${widget.areguments["price"]}, "
                    "Quantity: ${widget.quantity[widget.index]}"
            )
        ),
      ],
    );
  }

}

