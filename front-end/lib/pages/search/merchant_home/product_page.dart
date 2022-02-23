import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

main() => runApp(
  MaterialApp(
    home: ProductPage()
  )
);


class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carousel Demo"),),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              width: MediaQuery.of(context).size.width * 0.75,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Merchant Name",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  enlargeCenterPage: false,
                ),
                items: [1,2,3,4,5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: 500,
                        margin: EdgeInsets.symmetric(horizontal: 1),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Cake Name",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.blue[200],
              height: 300,
            )
          ],
        ),
      ),
    );
  }
}
