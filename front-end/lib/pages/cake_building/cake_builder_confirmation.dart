import 'package:flutter/material.dart';

class CakeBuilderConfirmation extends StatefulWidget {
  final String baseSize;
  final String baseFlavor;
  final String baseColor;
  final String frostingType;
  final String frostingColor;
  final List<String> toppings;

  const CakeBuilderConfirmation({Key? key,
    required this.baseSize,
    required this.baseFlavor, required this.baseColor, required this.frostingType,
    required this.frostingColor, required this.toppings,
  }) : super(key: key);

  @override
  CakeBuilderConfirmationBody createState() => CakeBuilderConfirmationBody();
}

class CakeBuilderConfirmationBody extends State<CakeBuilderConfirmation> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Confirm Your Cake"),
          // foregroundColor: Colors.red[900],
          // backgroundColor: Colors.red[100],
          // toolbarHeight: 50,
      ),

      body:
      SingleChildScrollView(
       child: Container(
        color: Color.fromARGB(255, 249, 243, 235),

        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),

        child: Center (
          child: Column(
            children: [
                Text("BASE SIZE", style: _labelTextStyle()),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (widget.baseSize.isEmpty)
                      Text("Any Size", style: TextStyle(fontSize: 22)),
                    for (int i = 0; i < widget.baseSize.length; i++)
                      Text(widget.baseSize[i].toString(), style: TextStyle(fontSize: 22)),
                  ],
                ),
                SizedBox(height: 10),

                Text("BASE FLAVOR", style: _labelTextStyle()),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (widget.baseFlavor.isEmpty)
                      Text("Any Flavor", style: TextStyle(fontSize: 22)),
                    for (int i = 0; i < widget.baseFlavor.length; i++)
                    Text(widget.baseFlavor[i].toString(), style: TextStyle(fontSize: 22)),
                  ],
                ),

                SizedBox(height: 10),
                Text("BASE COLOR", style: _labelTextStyle()),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (widget.baseColor.isEmpty)
                      Text("Any Color", style: TextStyle(fontSize: 22)),
                    for (int i = 0; i < widget.baseColor.length; i++)
                      Text(widget.baseColor[i].toString(), style: TextStyle(fontSize: 22)),
                  ],
                ),

                SizedBox(height: 10),
                Text("FROSTING TYPE", style: _labelTextStyle()),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (widget.frostingType.isEmpty)
                      Text("Any Type", style: TextStyle(fontSize: 22)),
                    for (int i = 0; i < widget.frostingType.length; i++)
                      Text(widget.frostingType[i].toString(), style: TextStyle(fontSize: 22)),
                  ],
                ),

                SizedBox(height: 10),
                Text("FROSTING COLOR", style: _labelTextStyle()),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (widget.frostingColor.isEmpty)
                      Text("Any Color", style: TextStyle(fontSize: 22)),
                    for (int i = 0; i < widget.frostingColor.length; i++)
                      Text(widget.frostingColor[i].toString(), style: TextStyle(fontSize: 22)),
                  ],
                ),

                SizedBox(height: 10),
                Text("TOPPINGS", style: _labelTextStyle()),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (widget.toppings.isEmpty)
                      Text("None", style: TextStyle(fontSize: 22)),
                    for (int i = 0; i < widget.toppings.length; i++)
                      Text(widget.toppings[i].toString(), style: TextStyle(fontSize: 22)),
                  ],
                ),

                SizedBox(height: 10),
                ElevatedButton(
                  style: ButtonStyle (
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade400),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)
                          )
                      )
                  ),
                  // TODO: add to shopping cart
                  onPressed: () {},
                  child: Text("ADD TO CART", style: TextStyle(fontSize: 22)),
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  TextStyle _labelTextStyle() {
    // test decoration for label of the block
    return TextStyle(
        fontSize: 20,
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

