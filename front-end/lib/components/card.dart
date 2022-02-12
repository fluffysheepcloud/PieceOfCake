import 'package:flutter/material.dart';

//this is like an object class
class InfoCard extends StatelessWidget {
  //var arguments;
  //infocard constructor of class
  //description, title, img url
  InfoCard(this.title, this.description, /*{Key? key,  required this.arguments}) : super(key: key*/);
  //these are its attributes, this.imgurl
  String description;
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
                color: Colors.brown[200],
                child: InkWell(
                    splashColor: Colors.brown.withAlpha(70),
                    onTap: () {
                      debugPrint('Card tapped.');
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
                                  child:  Text(description), //arguments["description"]
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