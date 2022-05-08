import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:frontend/utils/toast.dart';

/* this class is the block component
* a block contains multiple items that
* show the capabilities of the slected
* merchant
* */
class IngredientBlock extends StatefulWidget {

  // it shows what type of items, e.g layers
  String blockLabel;
  // the list that contains the items(in String format)
  List<Map> blockItems;
  // controller used to get the selected items
  MultiSelectController controller;
  // this is a list of cards that contain the info of each items
  int maxLimit;
  late List<MultiSelectCard> _itemsCards;

  IngredientBlock({
    required this.controller,
    required this.blockLabel,
    required this.blockItems,
    required this.maxLimit,
    Key? key
  }) : super(key: key);

  @override
  _IngredientBlockState createState() => _IngredientBlockState();
}

class _IngredientBlockState extends State<IngredientBlock> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      // this padding is used to control the distance between each blocks
      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange[50],
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        // this padding is used to control the distance between items and
        // the border of the card
        padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // text widget to show the label(title) of the block
            Text(
              widget.blockLabel,
              style: _labelTextStyle(),
            ),
            Divider(color: Colors.brown),
            // the widget to show items
            MultiSelectContainer(
              maxSelectableCount: widget.maxLimit,
              // bind controller
              controller: widget.controller,
              itemsDecoration: _blockDecoration(),
              // items requires a list of MultiSelectCard
              items: widget._itemsCards,
              onChange: (List<Object?> selectedItems, Object? selectedItem) {},
              onMaximumSelected: (allSelectedItems, selectedItem) {
                ToastUtil.showToast('The limit has been reached');
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // init the itemsCards
    widget._itemsCards = widget.blockItems.map(
      (item) => MultiSelectCard(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        value: item["id"],
        label: item["name"].toString(),
      )
    ).toList();
  }

  TextStyle _labelTextStyle() {
    // test decoration for label of the block
    return TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.brown,
      letterSpacing: 3.5,
      shadows: [
        Shadow(
          color: Colors.brown.withOpacity(0.4),
          offset: Offset(0, 3),
        )
      ]
    );
  }

  MultiSelectDecorations _blockDecoration() {
    // it will apply this decoration to all items button
    return MultiSelectDecorations(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      selectedDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.brown
        // gradient: RadialGradient(
        //   colors: const [
        //     Colors.red
        //   ]
        // ),
      )
    );
  }
}
