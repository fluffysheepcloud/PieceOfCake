import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/merchant/shop_manager/capabilities/capability_card.dart';

import 'add_capability_card.dart';

// this class is the block component that contains multiple items that the
// the merchant has in their profile

class CapabilityBlock extends StatefulWidget {
  // refers to base size, base flavor, base color, etc
  String blockLabel;

  // map that contains the name of the item and price of the item
  List items;

  CapabilityBlock({
    required this.blockLabel,
    required this.items,
    Key? key
  }) : super(key: key);

  @override
  _CapabilityBlockState createState() => _CapabilityBlockState();
}

class _CapabilityBlockState extends State<CapabilityBlock> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      // color: Colors.pink,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${widget.blockLabel}"),
          Divider( thickness: 3.0,),
          Wrap(children: [
            for (int i = 0; i < widget.items.length; i++)
              // Container()
              CapabilityCard(widget.blockLabel, widget.items[i], _removeItem),

            AddCapabilityCard(widget.blockLabel, widget.items, () => setState(() {}))
          ])
        ],
      ),
    );
  }

  TextStyle _labelTextStyle() {
    // test decoration for label of the block
    return TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: 3.5,
        shadows: [
          Shadow(
            color: Colors.red.shade500.withOpacity(0.4),
            offset: Offset(0, 3),
          )
        ]
    );
  }

  _removeItem(Object? o) {
    setState(() {
      widget.items.remove(o);
    });
  }

}