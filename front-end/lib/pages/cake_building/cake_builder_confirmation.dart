import 'package:flutter/material.dart';

class CakeBuilderConfirmation extends StatefulWidget {
  final List<String> baseFlavor;
  final List<String> baseColor;
  final List<String> frostingType;
  final List<String> frostingColor;
  final List<String> toppings;

  const CakeBuilderConfirmation({Key? key,
    required this.baseFlavor, required this.baseColor, required this.frostingType,
    required this.frostingColor, required this.toppings
  }) : super(key: key);

  @override
  CakeBuilderConfirmationBody createState() => CakeBuilderConfirmationBody();
}

class CakeBuilderConfirmationBody extends State<CakeBuilderConfirmation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Confirm Your Cake")
      ),
      body: Text("${widget.baseFlavor}")
    );
  }
}

