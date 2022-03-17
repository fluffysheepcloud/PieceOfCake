import 'package:flutter/material.dart';

class AddCapabilityCard extends StatelessWidget {
  const AddCapabilityCard({Key? key}) : super(key: key);

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
            child: Icon(
              Icons.add_circle_outline,
              color: Colors.red.shade900,
            )
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
