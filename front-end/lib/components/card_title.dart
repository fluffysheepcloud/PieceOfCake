import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {

  final String orderNumber;
  final String status;

  const CardTitle(this.orderNumber, this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(padding: EdgeInsets.only(left: 8, top: 5), child: Text("Order#: ${orderNumber}")),
        Padding(padding: EdgeInsets.only(right: 8, top: 5), child: Text("${status}")),
      ],
    );
  }
}
