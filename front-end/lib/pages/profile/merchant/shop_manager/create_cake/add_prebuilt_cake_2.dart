import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';


// photo taking/gallery and tags on this page
class AddPrebuiltCake2 extends StatefulWidget {
  final String cakeName;
  final String cakeDescription;
  final double cakePrice;
  final int cakeQuantity;

  const AddPrebuiltCake2({Key? key,
    required this.cakeName, required this.cakeDescription, required this.cakePrice,
    required this.cakeQuantity,}) : super(key: key);

  @override
  AddPrebuiltCake2Body createState() => AddPrebuiltCake2Body();
}


class AddPrebuiltCake2Body extends State<AddPrebuiltCake2> {
  //Holds image File
  // this doesn't show up for whatever reason...
  File _image = File('assets/images/PieceOfCakeLogo.png');
  //ImagePicker instance.
  final picker = ImagePicker();

  // for the tags that the merchant inputs
  List<String> _tags = [];

  TextFieldTagsController _textFieldTagsController = TextFieldTagsController();

  @override
  void initState() {
    super.initState();
    //listen for everything being entered here if you want suggestions
    TextFieldTagsController.getTextEditingController.addListener(() {
      TextFieldTagsController.getTextEditingController.text;
    });
    _tags = ['your', 'tags'];
  }

  //ImageSource: Camera and Gallery.
  _getImage(ImageSource imageSource) async
  {
    PickedFile? imageFile = await picker.getImage(source: imageSource);
    //if user doesn't take any image, just return.
    if (imageFile == null) return;
    setState(
          () {
        //Rebuild UI with the selected image.
        _image = File(imageFile.path);
      },
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add a New Prebuilt Cake'),
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold),
        backgroundColor: Colors.brown[700],
      ),
        body: SingleChildScrollView(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    const EdgeInsets.only(left: 4.0, top: 2.0),
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
              if (tag.length > 10) {
                return 'You have hit the maximum number of tags';
              } else if (tag.isEmpty) {
                return 'Please enter at least one tag';
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
                // //Clear the textfield and tags
                // _textFieldTagsController.clearTextFieldTags();
                //
                // //Set a new custom error
                // _textFieldTagsController.showError(
                //   "Clear?",
                //   errorStyle: const TextStyle(color: Colors.purple),
                // );
                //
                // //Set the focus of the textfield if you choose
                // TextFieldTagsController.getFocusNode.unfocus();

                //set all tags
                _tags = _textFieldTagsController.getAllTags;

                //Submit form
                },
                  child: const Text('Add Cake',
                    style: TextStyle(color: Colors.white, fontSize: 15),),
                )
              ],
            ),
            // // button for creating the new cake
            // TextButton(
            //   style: TextButton.styleFrom
            //     (backgroundColor: Colors.brown[700]),
            //   // TODO: add this cake to the merchant's shop
            //   onPressed: () {},
            //   child: Text(
            //     'Add Cake',
            //     style: TextStyle(color: Colors.white, fontSize: 15),
            //   ),
            // )
          ],
        ),
      )
    );
  }
}