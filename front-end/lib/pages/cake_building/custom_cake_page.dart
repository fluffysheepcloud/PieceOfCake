import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:frontend/network/merchant_service.dart';
import 'package:frontend/pages/profile/merchant/shop_manager/create_cake/ingredient_block.dart';
import 'package:frontend/utils/shared_preferences.dart';
import 'cake_builder_confirmation.dart';

class CustomCakePage extends StatefulWidget {

  var arguments;

  CustomCakePage({this.arguments, Key? key}) : super(key: key);

  @override
  CustomCakeBuilderBody createState() => CustomCakeBuilderBody();
}

class CustomCakeBuilderBody extends State<CustomCakePage> {

  late List<MultiSelectController> controllers;

  Future<Map> mockIngredients() async {
    // final String res = await rootBundle.loadString('assets/mock/mock_ingredients.json');
    // // ingredient is a list of size 6 (call ingredient.length in ItemCount)
    // var ingredients = json.decode(res)['data']
    Map ingredients = (await getMerchantCapability(1))["data"];
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

  // pass selected items to the confirmation page
  _getSelectedItems() {
    // controllers.forEach((element) {
    //   var items = List<String>.from(element.getSelectedItems());
    //   print(items);
    // });
    print(controllers[0].getSelectedItems().toString());
    var route = MaterialPageRoute(builder: (BuildContext context) =>
        CakeBuilderConfirmation(
            baseSize: (controllers[0].getSelectedItems()[0].toString()),
            baseFlavor: (controllers[1].getSelectedItems()[0].toString()),
            baseColor: (controllers[2].getSelectedItems()[0].toString()),
            frostingType: (controllers[3].getSelectedItems()[0].toString()),
            frostingColor: (controllers[4].getSelectedItems()[0].toString()),
            toppings: List<String>.generate(controllers[5].getSelectedItems().length,
                    (index) => (controllers[5].getSelectedItems()[index].toString()))));

    Navigator.of(context).push(route);

  }

  Widget _pageBuilder(AsyncSnapshot snapshot) {
    Map ingredientMap = snapshot.data;
    // init controllers based on the number of blocks
    _initControllers(ingredientMap.length);

    // build a list of block components
    var blockList = _blockListBuilder(ingredientMap, controllers);
    // add a button at the end of the list
    blockList.add(
      Padding(
        padding: EdgeInsets.only(bottom: 25, top: 10,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3),
        child: ElevatedButton(
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
          onPressed: _getSelectedItems,
          child: Text("Next"),
        ),
      )
    );

    // return the page
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Build Your Cake'),
          // foregroundColor: Colors.red[900],
          // backgroundColor: Colors.red[100],
          // toolbarHeight: 50,
        ),
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
        blockItems: List<Map>.from(ingredientMap[keyList[index]] ?? [""]),
        maxLimit: index == 5 ? 4 : 1)
    );
  }
}