import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IngredientBlock extends StatelessWidget {

  String flavor;
  String color;
  String frostingType;
  String frostingColor;
  String toppings;

  IngredientBlock({required this.flavor, required this.color, required this.frostingType, required this.frostingColor, required this.toppings, Key? key}) : super(key: key);

  Future<List> BaseFlavor() async {
    final String res = await rootBundle.loadString('assets/mock/mock_ingredients.json');
    var baseFlavor = json.decode(res)["data"] as List;
    return baseFlavor;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}