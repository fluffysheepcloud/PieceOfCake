import 'package:flutter/material.dart';

// this is a component that symbolizes the name of the specific ingredient and price
// appearance: vertical composition - name of the ingredient, divider, price of the ingredient
class CapabilityCard extends StatelessWidget {
  var arguments;

  CapabilityCard(this.name, this.price, {Key? key}) : super(key: key);

  String name;
  double price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 150,
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
              Text(name, style: _labelTextStyle()),
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
