import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/customer/review/unreviewed_card.dart';

class UnreviewedPage extends StatefulWidget {
  const UnreviewedPage({Key? key}) : super(key: key);

  @override
  _UnreviewedPageState createState() => _UnreviewedPageState();
}

class _UnreviewedPageState extends State<UnreviewedPage> {

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      _data.add({
        "orderNumber": i.toString(),
        "imageURL": "assets/images/cake.jpg"
      });
    }
  }

  List<Map> _data = <Map>[];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Center(
        child: ListView.builder(
            padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
            itemCount: _data.length,
            itemBuilder: (context, index) {
              return UnreviewedCard(
                key: ObjectKey(_data[index]),
                orderNumber: _data[index]["orderNumber"],
                imageURL: _data[index]["imageURL"],
                onDeleteClicked: () => _deleteItem(_data[index]),
              );
            }
        ),
      )
    );
  }

  _deleteItem(Map m) {
    _data.remove(m);
    setState(() {});
  }


}

