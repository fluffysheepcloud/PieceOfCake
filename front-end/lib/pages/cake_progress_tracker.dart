import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

void main() {
  runApp(MaterialApp(
    title: 'Edit Cake Progress',
    home: CanceledOrder(),
  ));
}

class CanceledOrder extends StatelessWidget {

  var arguments;

  CanceledOrder({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
        builder: TimelineTileBuilder.fromStyle(
        contentsAlign: ContentsAlign.alternating,
        contentsBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text('Timeline Event $index'),
    ),
    itemCount: 10,
    ),
    );
  }
}
