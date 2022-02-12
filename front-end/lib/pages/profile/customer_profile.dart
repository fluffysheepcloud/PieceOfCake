import 'package:flutter/material.dart';

class CustomerProfile extends StatelessWidget {
  const CustomerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('[USERNAME]\'s Profile'),
        backgroundColor: Colors.red[100],
        toolbarHeight: 50,
      ),
      body: CustomerProfileBody(),);
  }
}

class CustomerProfileBody extends StatelessWidget {
  List<String> blocks = [
    'My Orders',
    'My Favorites',
    'Personal Information',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                children: [
                  // for box background
                  Container(
                    decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://i.ibb.co/yR6jPj5/FETH-official-art.jpg'),
                      fit: BoxFit.cover
                      )
                    ),

                    child: Container(
                        width: double.infinity,
                        height: 200,
                      // for circle avatar
                      child: Container(
                        alignment: Alignment(0.0,2.5),
                        child: CircleAvatar(
                        backgroundImage: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                        radius: 60.0,
                        ),
                      ),
                  ),
                ),

                const Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 35.0, bottom: 15.0)),

                for (int i = 0; i < 3; i++)

                Container(
                    margin: EdgeInsets.only(top: 15),
                    //elevation: 2.0,
                    color: Colors.grey[400],
                    child: Container(
                        padding: EdgeInsets.only(left: 5, right: 275, top: 5.0, bottom: 70.0),
                        child: Text(blocks[i],
                          style: TextStyle(
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300
                        ),
                        ),
                    )
                ),
            ],
        ),
      ),
    );
  }
}