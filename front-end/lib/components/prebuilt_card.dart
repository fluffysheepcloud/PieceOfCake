import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/merchant/shop_manager/merchant_shop.dart';
import 'package:frontend/pages/search/merchant_home/product_page.dart';

//TODO: Navigate to the cake prodcut page
//takes in price, name, pic
//this is like an object class
class PrebuiltCard extends StatelessWidget {
  //infocard constructor of class
  //description, title, img url
  final String imageUrl;
  final Map cakeInfo;
  final String merchantName;
  const PrebuiltCard(this.imageUrl, this.cakeInfo, this.merchantName, {Key? key}) : super(key: key); /*{Key? key,  required this.arguments}) : super(key: key*/
  //these are its attributes, this.imgurl

  //var arguments ; //var can be all types
  //{Key ? key, this.arguments} indicates that the arguments can be option/can be null
  //Scaffold is a whole page, Center is a container for elements

  @override
  //this is a method for the specific class (build the object)
  Widget build(BuildContext context) {
    //remove scaffold later
        return SizedBox(
            width: 400,
            height: 250,
            child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.all(10),
                color: Theme.of(context).primaryColor,
                child: InkWell(
                    splashColor: Colors.brown.withAlpha(70),
                    onTap: () {
                      debugPrint('Card tapped.');
                      //pass id into product page which gets the cakes details - talk to guanyu about this
                      Navigator.pushNamed(
                          context, "/product_page", arguments: {
                        "merchantName": merchantName,
                        "avatarURL": "assets/images/merchant_avatar.jpg",
                        "cakeURLs": [
                          "assets/images/cake.jpg",
                          "assets/images/cake_2.jpg",
                          "assets/images/cake_3.jpg",
                          "assets/images/cake_4.jpg",
                          "assets/images/cake_5.jpg"
                        ],
                        "description": "This is the description...",
                        "price": cakeInfo["price"]
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                            image: DecorationImage(
                              //cardbackend.image
                              image: AssetImage('assets/images/cake.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        ),
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child:  Text(merchantName),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Price: \$${cakeInfo["price"].toString()}")
                                ),
                              ],
                            )
                        )
                      ],
                    )
                )
            )
        );
  }
}