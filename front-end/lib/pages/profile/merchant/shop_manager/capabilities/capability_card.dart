import 'package:flutter/material.dart';

// this is a component that symbolizes the name of the specific ingredient and price
// appearance: vertical composition - name of the ingredient, divider, price of the ingredient
class CapabilityCard extends StatelessWidget {
  var arguments;

  CapabilityCard(this.id, this.name, this.price, {Key? key}) : super(key: key);

  int id;
  String name;
  double price;

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
          debugPrint('Ingredient tapped');
        },
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2, right: 2),
              child: Text(name, style: _labelTextStyle())
            ),
            Divider(color: Colors.red.shade900),
            Text(price.toString(), style: _labelTextStyle())
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
