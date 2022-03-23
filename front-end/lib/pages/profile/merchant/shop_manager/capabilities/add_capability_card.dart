import 'package:flutter/material.dart';

class AddCapabilityCard extends StatelessWidget {

  final String title;

  const AddCapabilityCard(this.title, {Key? key}) : super(key: key);

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
              Navigator.pushNamed(context, "/profile/merchant/shop_manager/add_capability",
              arguments: {
                "title": title
              });
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
