import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


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
        body: Column(
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
            
            TextButton(
              style: TextButton.styleFrom
                (backgroundColor: Colors.brown[700]),
              // TODO: add this cake to the merchant's shop
              onPressed: () {},
              child: Text(
                'Add Cake',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          ],
        ),
      );
  }
}