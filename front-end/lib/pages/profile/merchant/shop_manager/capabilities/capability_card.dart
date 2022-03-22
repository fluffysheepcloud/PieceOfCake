import 'package:flutter/material.dart';

// this is a component that symbolizes the name of the specific ingredient and price
// appearance: vertical composition - name of the ingredient, divider, price of the ingredient
class CapabilityCard extends StatefulWidget {

  var arguments;

  int id;
  String title;
  String name;
  double price;

  CapabilityCard(this.id, this.title, this.name, this.price, {this.arguments, Key? key}) : super(key: key);

  @override
  _CapabilityCardState createState() => _CapabilityCardState();
}

class _CapabilityCardState extends State<CapabilityCard> {


  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.95 * 0.25,
        height: 100,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          margin: const EdgeInsets.all(10),
          color: Colors.red[100],

          child: InkWell(
            splashColor: Colors.red[300],
            onTap: (){
              Navigator.pushNamed(context, "/profile/merchant/shop_manager/change_capability", arguments: {
                "id": widget.id,
                "title": widget.title,
                "name": widget.name,
                "price": widget.price
              }).then((value) {
                setState(() {
                  widget.price = double.parse(value.toString());
                });
              });
            },
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 2, right: 2),
                    child: Text(widget.name, style: _labelTextStyle())
                ),
                Divider(color: Colors.red.shade900),
                Text(widget.price.toString(), style: _labelTextStyle())
              ],
            ),
          ),
        )
    );
  }

  TextStyle _labelTextStyle() {
    // test decoration for label of the block
    return TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.red.shade900,
    );
  }
}

