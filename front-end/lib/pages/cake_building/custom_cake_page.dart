import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:frontend/pages/cake_building/ingredient_block.dart';

class CustomCakePage extends StatefulWidget {

  var arguments;

  CustomCakePage({this.arguments, Key? key}) : super(key: key);

  @override
  CustomCakeBuilderBody createState() => CustomCakeBuilderBody();
}

class CustomCakeBuilderBody extends State<CustomCakePage> {

  late List<MultiSelectController> controllers;

  Future<Map> mockIngredients() async {
    final String res = await rootBundle.loadString('assets/mock/mock_ingredients.json');
    var ingredients = json.decode(res)["data"];
    return ingredients;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: mockIngredients(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          else {
            // make sure the map is not null
            if (snapshot.hasData) {
              return _pageBuilder(snapshot);
            }
            else {
              return Text("Error: fail to request data");
            }
          }
        }
        else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  _initControllers(int length) {
    controllers = List.generate(
      length,
      (index) => MultiSelectController()
    );
  }

  // TODO: This will be change to add this cake into shopping cart
  _getSelectedItems() {
    controllers.forEach((element) {
      var items = List<String>.from(element.getSelectedItems());
      print(items);
    });
  }

  Widget _pageBuilder(AsyncSnapshot snapshot) {
    Map ingredientMap = snapshot.data;
    // init controllers based on the number of blocks
    _initControllers(ingredientMap.length);

    // build a list of block components
    var blockList = _blockListBuilder(ingredientMap, controllers);
    // add a button at the end of the list
    blockList.add(ElevatedButton(
        onPressed: _getSelectedItems,
        child: Text("Add to Cart")
      )
    );

    // return the page
    return Scaffold(
      appBar: AppBar(title: Text("Build Cake")),
      body: Container(
        color: Color.fromARGB(255, 249, 243, 235),
        child: ListView(
          padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
          children: blockList,
        )
      ),
    );
  }

  List<Widget> _blockListBuilder(Map ingredientMap, List<MultiSelectController> controllers) {
    // get all keys (flavor, color...)
    List keyList = ingredientMap.keys.toList();
    return List.generate(
      ingredientMap.length,
      (index) => IngredientBlock(
        // pass the controller as argument
        controller: controllers[index],
        blockLabel: keyList[index],
        // IMPORTANT: it check if the list is null by "??", and then re-create the list
        // from List<dynamic> to List<String>
        blockItems: List<String>.from(ingredientMap[keyList[index]] ?? [""]))
    );
  }
}