import 'package:flutter/material.dart';
import 'package:frontend/pages/merchant_shop.dart';
import 'package:frontend/pages/search/merchant_home/product_page.dart';

//TODO: Navigate to the cake prodcut page
//takes in price, name, pic
//this is like an object class
class PrebuiltCard extends StatelessWidget {
  //infocard constructor of class
  //description, title, img url
  PrebuiltCard(this.title, this.price, this.id); /*{Key? key,  required this.arguments}) : super(key: key*/
  //these are its attributes, this.imgurl
  int id;
  String price;
  String title;
  var arguments ; //var can be all types
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MerchantShop(id)//ProductPage(id: id,),
                          ));
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
                                  child:  Text(title),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child:  Text(price), //arguments["description"]
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