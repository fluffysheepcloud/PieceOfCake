import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/pages/cake_building/ingredient_block.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Build a Cake',
    home: new CustomCakeBuilder(),
  ));
}

class CustomCakeBuilder extends StatefulWidget {
  const CustomCakeBuilder({Key? key}) : super(key: key);

  @override
  CustomCakeBuilderBody createState() => CustomCakeBuilderBody();
}

class CustomCakeBuilderBody extends State<CustomCakeBuilder> {
  Future<List> MockIngredients() async {
    final String res = await rootBundle.loadString('assets/mock/mock_ingredients.json');
    var ingredients = json.decode(res)["data"] as List;
    return ingredients;
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: FutureBuilder<List>(
        future: MockIngredients(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return ingredientBlock(snapshot);
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget ingredientBlock(AsyncSnapshot snapshot) {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return IngredientBlock(
            flavor: snapshot.data[index]['flavor'],
            color: snapshot.data[index]['color'],
            frostingType: snapshot.data[index]['frostingType'],
            frostingColor: snapshot.data[index]['frostingColor'],
            toppings: snapshot.data[index]['toppings']
          );
        }
    );
  }
}