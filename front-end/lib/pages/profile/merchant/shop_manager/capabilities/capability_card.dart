import 'package:flutter/material.dart';

// this is a component that symbolizes the name of the specific ingredient and price
// appearance: vertical composition - name of the ingredient, divider, price of the ingredient
class CapabilityCard extends StatefulWidget {


  String title;
  Map info;
  final void Function(Object? o) removeItem;

  CapabilityCard(this.title, this.info, this.removeItem, {Key? key}) : super(key: key);

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
                "info": widget.info,
                "title": widget.title
              }).then((value) {
                if (value != null) {List res = value as List;
                  // Update
                  if (res[0] == 0) {
                    setState(() {
                      widget.info["price"] = double.parse(res[1].toString());
                    });
                  }
                  // Delete
                  else if (res[0] == 1) {
                    widget.removeItem(res[1]);
                  }
                }
              });
            },
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 2, right: 2),
                    child: Text(widget.info["name"].toString(), style: _labelTextStyle())
                ),
                Divider(color: Colors.red.shade900),
                Text(widget.info["price"].toString(), style: _labelTextStyle())
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

