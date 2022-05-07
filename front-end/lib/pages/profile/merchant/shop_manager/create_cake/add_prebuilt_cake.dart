import 'dart:convert';
// import 'package:textfield_tags/textfield_tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:frontend/components/input_text_box.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:frontend/utils/shared_preferences.dart';
import 'package:frontend/utils/toast.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'ingredient_block.dart';
import 'package:frontend/network/prebuilt_cake_service.dart';
import 'package:frontend/network/merchant_service.dart';
import 'package:frontend/domain/PrebuildCake.dart';


// cake name, cake description, cake price, cake quantity, image upload, tags, on this page
class AddPrebuiltCake extends StatefulWidget {
  var arguments;

  AddPrebuiltCake({Key? key, this.arguments}) : super(key: key);

  @override
  _AddPrebuiltCakeState createState() => _AddPrebuiltCakeState();
}

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}

// add capabilities to prebuilt cake
class _AddPrebuiltCakeState extends State<AddPrebuiltCake> {
  late final TextEditingController _cake_name;
  late final TextEditingController _cake_description;
  late final CurrencyTextInputFormatter _cake_price;

  // specify the specifics
  late List<MultiSelectController> controllers;

  // for selecting images
  final ImagePicker _picker = ImagePicker();
  File? image;
  List<File> multipleImages = [];

  // // for the tags that the merchant inputs
  // List<String> _tags = [];
  //
  // TextFieldTagsController _textFieldTagsController = TextFieldTagsController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _cake_name = TextEditingController();
    _cake_description = TextEditingController();
    _cake_price = CurrencyTextInputFormatter();

    // // //listen for everything being entered here if you want suggestions
    // TextFieldTagsController.getTextEditingController.addListener(() {
    //   TextFieldTagsController.getTextEditingController.text;
    // });
    // _tags = ['your', 'tags'];

    super.initState();
  }

  @override
  void dispose() {
    _cake_name.dispose();
    _cake_description.dispose();
    // _cake_quantity.dispose();

    super.dispose();
  }

  _initControllers(int length) {
    controllers = List.generate(
        length,
        (index) => MultiSelectController()
    );
  }

  Future<Map> mockIngredients() async {
    int id = (await SPUtil.getUserData())["id"];
    Map data = (await getMerchantCapability(id))["data"];
    return data;
  }

  Widget _pageBuilder(AsyncSnapshot snapshot) {
    Map ingredientMap = snapshot.data;
    // init controllers based on the number of blocks
    _initControllers(ingredientMap.length);

    // build a list of block components
    var blockList = _blockListBuilder(ingredientMap, controllers);

    return Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Add a New Cake'),
        ),
        body:
        LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      buildCake(context),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            color: Colors.orange[50],
                            child: Column (
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Divider(thickness: 1, color: Colors.brown),
                                Text(
                                  "Cake Specifications",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold, color: Colors.brown),
                                )
                              ],
                            ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 950,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
                            scrollDirection: Axis.vertical,
                            itemCount: blockList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return blockList[index];
                            },
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10.0)),
                      // Add cake to database
                      TextButton(
                        style: TextButton.styleFrom
                          (backgroundColor: Colors.brown[700]),
                        onPressed: () async {
                          int merchantId = (await SPUtil.getUserData())["id"];
                          String cakeName = _cake_name.text.toString();
                          int baseSizeId = int.parse(controllers[0].getSelectedItems()[0].toString());
                          int baseColorId = int.parse(controllers[1].getSelectedItems()[0].toString());
                          int baseFlavorId = int.parse(controllers[2].getSelectedItems()[0].toString());
                          int frostingColorId = int.parse(controllers[3].getSelectedItems()[0].toString());
                          int frostingFlavorId = int.parse(controllers[4].getSelectedItems()[0].toString());
                          double price = double.parse(_cake_price.getUnformattedValue().toString());

                          List<int> toppingIds = List<int>.generate(controllers[5].getSelectedItems().length,
                                  (index) => int.parse(controllers[5].getSelectedItems()[index].toString())
                          );

                          PrebuildCake cake = PrebuildCake(merchantId,
                              cakeName, baseSizeId, baseFlavorId,
                              baseColorId, frostingColorId,
                              frostingFlavorId, price, toppingIds);

                          var res = await addMerchantPrebuildCakes(cake);

                          if (res != null && res["code"] == 200) {
                            ToastUtil.showToast("Success");
                            Navigator.pop(context);
                          }
                          else {
                            ToastUtil.showToast("Error");
                          }
                        },
                        child: const Text('Add Cake',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                        )
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
    );

  }

  List<Widget> _blockListBuilder(Map ingredientMap, List<MultiSelectController> controllers) {
    // get all keys (flavor, color...)
    List keyList = ingredientMap.keys.toList();
    print(keyList);
    print(ingredientMap);
    return List.generate(
      ingredientMap.length,
      (index) => IngredientBlock(
        // pass the controller as argument
        controller: controllers[index],
        blockLabel: keyList[index],
        // IMPORTANT: it check if the list is null by "??", and then re-create the list
        // from List<dynamic> to List<String>
        blockItems: List<Map>.from(ingredientMap[keyList[index]] ?? [""]),
        maxLimit: index == 5 ? 4 : 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: mockIngredients(),
      builder: (context, AsyncSnapshot snapshot) {
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

  Widget buildCake(BuildContext context) {
    return Form(
      key: _formKey,
        child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // enter cake name
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                    color: Colors.orange[50],
                    child: InputTextBox("Cake Name", "the name of your cake", _cake_name)
                ),
              ),

              // enter description of cake
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    color: Colors.orange[50],
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cake Description",
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.brown),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: _cake_description,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 7,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  hintText: 'Enter the description of your cake',
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.deepOrange))
                              ),
                              obscureText: false,
                              validator: (value) {
                                if (value != null) {
                                  return value.trim().isNotEmpty ? null : "${"Cake Description"} cannot be empty!";
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                ),
              ),

              // enter cake price
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.orange[50],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      "Cake Price",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.brown),
                      ),

                      TextFormField(
                        initialValue: _cake_price.format('2000'),
                        inputFormatters: <TextInputFormatter>[_cake_price],
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Divider(thickness: 1, color: Colors.brown),
                    Text("Upload up to 6 photos",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.brown)),
                    ElevatedButton(
                        style: TextButton.styleFrom
                          (backgroundColor: Colors.brown[700]),
                        onPressed: () async {
                          List<XFile>? picked = await _picker.pickMultiImage();
                          setState(() {
                            multipleImages = picked!.map((e) => File(e.path)).toList();
                          });
                        },
                        child: const Text("Select Photos",
                            style: TextStyle(color: Colors.white, fontSize: 15)
                        )
                    ),
                  ]
                )

              ),

              Container (
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.brown,  // red as border color
                  ),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Column(
                    children: [
                      //other widgets
                      Expanded(
                        child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                            itemCount: multipleImages.length,
                            itemBuilder: (context, index) {
                              return GridTile(child: Image.file(multipleImages[index]));
                            }),
                      ),
                    ],
                  ),
                ),
              ),

              // spacing
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}