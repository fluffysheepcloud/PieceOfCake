import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toggle_switch/toggle_switch.dart';

class IngredientBlock extends StatelessWidget {

  List<String> flavor;
  List<String> color;
  List<String> frostingType;
  List<String> frostingColor;
  List<String> toppings;

  IngredientBlock({required this.flavor, required this.color, required this.frostingType, required this.frostingColor, required this.toppings, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Card(
              elevation: 5,
              color: Colors.deepOrange[100],
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5.0)),
              child: InkWell(
                child: Column(
                  children: [
                    Text("Base Flavor"),
                    ToggleSwitch(
                      initialLabelIndex: 0,
                      totalSwitches: flavor.length,
                      labels: flavor,
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),

                    const Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text("Base Color"),
                    ToggleSwitch(
                      initialLabelIndex: 0,
                      totalSwitches: color.length,
                      labels: color,
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),

                    const Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text("Frosting Type"),
                    ToggleSwitch(
                      initialLabelIndex: 0,
                      totalSwitches: frostingType.length,
                      labels: frostingType,
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),

                    const Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text("Frosting Color"),
                    ToggleSwitch(
                      initialLabelIndex: 0,
                      totalSwitches: frostingColor.length,
                      labels: frostingColor,
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),

                    const Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text("Toppings"),
                    ToggleSwitch(
                      initialLabelIndex: 0,
                      totalSwitches: toppings.length,
                      labels: toppings,
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ],
                ),),
            )
        )
    );
  }
  
}