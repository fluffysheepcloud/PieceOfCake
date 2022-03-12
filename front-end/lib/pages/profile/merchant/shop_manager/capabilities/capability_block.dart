import 'package:flutter/material.dart';

// this class is the block component that contains multiple items that the
// the merchant has in their profile

class CapabilityBlock extends StatefulWidget {
  // refers to base size, base flavor, base color, etc
  String blockLabel;

  // map that contains the name of the item and price of the item
  Map<String, double> blockItems;

  CapabilityBlock({
    required this.blockLabel,
    required this.blockItems,
    Key? key
  }) : super(key: key);

  @override
  _CapabilityBlockState createState() => _CapabilityBlockState();
}

class _CapabilityBlockState extends State<CapabilityBlock> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      // distance between each block
      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red.shade200.withOpacity(0.7),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.blockLabel, style: _labelTextStyle()),
            Divider(color: Colors.red.shade900),
            Container(

            )
          ]
        )
      )
    );
  }

  TextStyle _labelTextStyle() {
    // test decoration for label of the block
    return TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.red.shade900,
        letterSpacing: 3.5,
        shadows: [
          Shadow(
            color: Colors.red.shade500.withOpacity(0.4),
            offset: Offset(0, 3),
          )
        ]
    );
  }

}