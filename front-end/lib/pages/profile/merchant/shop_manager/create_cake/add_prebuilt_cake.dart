import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/input_text_box.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';


// cake name, cake description, cake price, cake quantity, image upload, tags, on this page
class AddPrebuiltCake extends StatefulWidget {
  var arguments;

  AddPrebuiltCake({Key? key, required this.arguments}) : super(key: key);

  @override
  _AddPrebuiltCakeState createState() => _AddPrebuiltCakeState();
}

// add capabilities to prebuilt cake
class _AddPrebuiltCakeState extends State<AddPrebuiltCake> {
  late final TextEditingController _cake_name;
  late final TextEditingController _cake_description;
  late final CurrencyTextInputFormatter _cake_price;
  late final TextEditingController _cake_quantity;

  // specify the specifics
  late final TextEditingController _base_size;
  late final TextEditingController _base_flavor;
  late final TextEditingController _frosting_type;
  late final TextEditingController _frosting_color;
  late final TextEditingController _toppings;

  // To store the image
  File _image = File('assets/images/PieceOfCakeLogo.png');
  final Image _empty_image = Image.asset('assets/images/PieceOfCakeLogo.png');

  //ImagePicker instance.
  final picker = ImagePicker();

  // for the tags that the merchant inputs
  List<String> _tags = [];

  TextFieldTagsController _textFieldTagsController = TextFieldTagsController();


  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _cake_name = TextEditingController();
    _cake_description = TextEditingController();
    _cake_price = CurrencyTextInputFormatter();
    _cake_quantity = TextEditingController();

    // specify the specifics
    _base_size = TextEditingController();
    _base_flavor = TextEditingController();
    _frosting_type = TextEditingController();
    _frosting_color = TextEditingController();
    _toppings = TextEditingController();


    // // //listen for everything being entered here if you want suggestions
    TextFieldTagsController.getTextEditingController.addListener(() {
      TextFieldTagsController.getTextEditingController.text;
    });
    _tags = ['your', 'tags'];

    super.initState();
  }

  @override
  void dispose() {
    _cake_name.dispose();
    _cake_description.dispose();
    _cake_quantity.dispose();

    // specify the specifics
    _base_size.dispose();
    _base_flavor.dispose();
    _frosting_type.dispose();
    _frosting_color.dispose();
    _toppings.dispose();
    super.dispose();
  }

  //ImageSource: Camera and Gallery
  _getImage(ImageSource imageSource) async
  {
    PickedFile? imageFile = await picker.getImage(source: imageSource);
    //if user doesn't take any image, just return.
    if (imageFile == null) {
      return _empty_image;
    }
    setState(
          () {
        //Rebuild UI with the selected image.
        _image = File(imageFile.path);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Add a New Prebuilt Cake'),
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
          backgroundColor: Colors.brown[700],
        ),
        body: buildCake(context),
    );
  }

  Widget buildCake(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
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

            // ENTER THE SPECIFICS
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.orange[50],
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Cake Specifications",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold, color: Colors.brown),
                      ),

                      // base size
                      Container(
                          color: Colors.orange[50],
                          child: InputTextBox("Base Size", "the size of your cake", _base_size)
                      ),

                      // base flavor
                      Container(
                          color: Colors.orange[50],
                          child: InputTextBox("Base Flavor", "the flavor of your cake", _base_flavor)
                      ),

                      // frosting type
                      Container(
                          color: Colors.orange[50],
                          child: InputTextBox("Frosting Type", "the frosting type for your cake", _frosting_type)
                      ),

                      // frosting color
                      Container(
                          color: Colors.orange[50],
                          child: InputTextBox("Frosting Color", "the frosting color for your cake", _frosting_color)
                      ),

                      // toppings
                      Container(
                          color: Colors.orange[50],
                          child: InputTextBox("Toppings", "the toppings for your cake", _toppings)
                      ),
                    ],
                  )
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

            // enter quantity of cakes
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.orange[50],
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cake Quantity",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.brown),
                      ),

                      TextField(
                        controller: _cake_quantity,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered
                      ),
                    ],
                  )
              ),
            ),

            Center(
              child: _image != null
                  ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 300,
                  height: 300,
                  child: Image.file(
                    _image,
                  ),
                ),
              )
                  : Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('No image selected'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                    onPressed: () => _getImage(ImageSource.gallery),
                    icon: Icon(Icons.image),
                    label: Text('gallery'),
                    style: TextButton.styleFrom(backgroundColor: Colors.brown[700])
                ),
                ElevatedButton.icon(
                    onPressed: () => _getImage(ImageSource.camera),
                    icon: Icon(Icons.camera),
                    label: Text('camera'),
                    style: TextButton.styleFrom(backgroundColor: Colors.brown[700])
                ),
              ],
            ),

            // spacing
            SizedBox(height: 10),

            // adding tags to the cake
            Column(
              children: [
                TextFieldTags(
                  textFieldTagsController: _textFieldTagsController,
                  letterCase: LetterCase.small,
                  initialTags: _tags,
                  textSeparators: const [' ', '.', ','],
                  tagsStyler: TagsStyler(
                    showHashtag: true,
                    tagMargin: const EdgeInsets.only(right: 4.0),
                    tagCancelIcon: const Icon(
                      Icons.cancel,
                      size: 15.0,
                      color: Colors.black,),
                    tagCancelIconPadding:
                    const EdgeInsets.only(left: 10.0, top: 2.0),
                    tagPadding: const EdgeInsets.only(
                      top: 2.0,
                      bottom: 4.0,
                      left: 8.0,
                      right: 4.0,
                    ),
                    tagDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade300,),
                      borderRadius: const BorderRadius.all(Radius.circular(20.0),),
                    ),
                    tagTextStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,),
                  ),
                  textFieldStyler: TextFieldStyler(
                    readOnly: false,
                    hintText: 'Tags',
                    isDense: false,
                    textFieldFocusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                    ),
                    textFieldBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                    ),
                  ),
                  onDelete: (tag) {
                    _tags.remove(tag);
                  },
                  onTag: (tag) {
                    _tags.add(tag);
                  },
                  validator: (String tag) {
                    if (tag.length > 15) {
                      return 'You have hit the maximum character length';
                    } else if (tag.isEmpty) {
                      return 'Please enter a tag';
                    } else if (_textFieldTagsController.getAllTags.contains(tag)) {
                      return 'This tag has already been entered';
                    }
                    return null;
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom
                    (backgroundColor: Colors.brown[700]),
                  // TODO: add this cake to the merchant's shop
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }

                    // //Clear the textfield and tags
                    _textFieldTagsController.clearTextFieldTags();
                    //
                    // //Set a new custom error
                    _textFieldTagsController.showError(
                      "Clear?",
                      errorStyle: const TextStyle(color: Colors.purple),
                    );
                    //
                    // //Set the focus of the textfield if you choose
                    TextFieldTagsController.getFocusNode.unfocus();

                    //set all tags
                    _tags = _textFieldTagsController.getAllTags;

                    //Submit form
                  },
                  child: const Text('Add Cake',
                    style: TextStyle(color: Colors.white, fontSize: 15),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}