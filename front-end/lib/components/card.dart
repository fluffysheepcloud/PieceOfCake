import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const InfoCard(),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
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
                                  //child: cardbackend.text or something like that
                                  child:  const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud '),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom
                                    (backgroundColor: Colors.brown[700]),
                                  onPressed: (){
                                    //TODO CUSTOMER HOME
                                  },
                                  child: const Text(
                                    'Learn More',
                                    style: TextStyle( color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    )
                )
            )
        )
    );

  }
}
