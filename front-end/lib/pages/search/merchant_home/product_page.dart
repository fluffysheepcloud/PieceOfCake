import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

main() => runApp(
  MaterialApp(
    home: ProductPage()
  )
);

class ProductPage extends StatefulWidget {

  final arguments;

  ProductPage({Key? key, this.arguments}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  static const String notFoundImage = "assets/images/404.jpg";

  late String _merchantName;
  String? _avatarURL;
  List<String>? _imageURLs;
  String? _cDescription;
  int? _price;

  int _itemCount = 0;
  // List<String> imageURLs = [
  //   "assets/images/cake.jpg",
  //   "assets/images/cake_2.jpg",
  //   "assets/images/cake_3.jpg",
  //   "assets/images/cake_4.jpg",
  //   "assets/images/cake_5.jpg"
  // ];


  @override
  void initState() {
    if (widget.arguments != null) {
       Map data = Map.from(widget.arguments);
       print(data);
       _merchantName = data["merchantName"];
       _avatarURL = data["avatarURL"];
       _imageURLs = data["cakeURLs"];
       _cDescription = data["description"];
       _price = data["price"];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carousel Demo"),),
      backgroundColor: Color(0xFFFAF3EA),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _avatarAndMerchantName(),
              _carousel(),
              // Show cake name
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  "Cake Name",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
              _description()
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarAndMerchantName() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      width: MediaQuery.of(context).size.width * 0.75,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(_avatarURL ?? notFoundImage),
            radius: 30.0,
          ),
          SizedBox(width: 10),
          Text(
            "${_merchantName}",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w300
            ),
          ),
        ],
      ),
    );
  }

  Widget _carousel() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          enlargeCenterPage: false,
        ),
        items: (_imageURLs ?? [notFoundImage]).map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: 500,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(i),
                    fit: BoxFit.cover
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),

              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _description() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      color: Color(0xFFF2E1CE),
      height:325,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _itemDetails(),
          // show price per cake
          Text(
              "\$${_price ?? "error"} USD",
              style: TextStyle(fontSize: 24)
          ),
          Divider(color: Colors.black,),
          Text("Quantity", style: TextStyle(fontWeight: FontWeight.w500),),
          _dropDownSelection(),
          SizedBox(height: 5),
          _addButton()
        ],
      ),
    );
  }

  Widget _itemDetails() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text("Item Details"),
          SizedBox(height: 15),
          Text(_cDescription ?? "Unknown description"),
          SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget _dropDownSelection() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<int>(
          value: _itemCount,
          elevation: 10,
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.black,
          ),
          icon: const Icon(Icons.arrow_drop_down_outlined),
          menuMaxHeight: 200,
          items: <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map<DropdownMenuItem<int>>(
                  (e) => DropdownMenuItem<int>(
                value: e,
                child: Center(child: Text(e.toString())),
              )
          ).toList(),
          onChanged: (int? value) {
            setState(() {
              _itemCount = value ?? 0;
            });
          },
        ),
      ),
    );
  }

  Widget _addButton() {
    return Center(
      child: SizedBox(
          width: 300,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              onPressed: () {},
              child: Text("Add to Cart")
          )
      )
    );
  }
}
