import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/merchant/shop_manager/merchant_shop.dart';


//this is like an object class
class MerchantCard extends StatelessWidget {

  MerchantCard(this.shopName, this.street, this.city, this.state, this.zip, this.id); /*{Key? key,  required this.arguments}) : super(key: key*/
  //these are its attributes, this.imgurl
  int id;
  String street;
  String city;
  String state;
  int zip;
  String shopName;

  var arguments ; //var can be all types
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MerchantShop(id),
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
                                  child:  Text(shopName),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child:  Text(street + "\n" + city + ", " + state + "\n " + zip.toString()),
                                ),
                                // ElevatedButton(onPressed: (){
                                //
                                // }, child: Text("Go to shop"))
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