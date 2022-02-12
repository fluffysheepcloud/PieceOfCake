import 'package:flutter/material.dart';

class CustomerProfile extends StatelessWidget {
  const CustomerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
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

  List<String> orderLinks = [
    'Bookmarks',
    'Past Orders',
    'Reviews'
  ];

  List<String> favoriteLinks = [
    'Cakes',
    'Merchants'
  ];

  List<String> personalInfo = [
    'Change Nickname',
    'Change Password',
    'Payment Methods'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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

                    child: SizedBox(
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

                //for spacing under the avatar
                const Padding(padding: EdgeInsets.only(top: 55.0)),
                Center(child:Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('My Orders',
                        style: TextStyle(fontSize: 22)))),

                //for (int i = 0; i < blocks.length; i++)
                Container(
                  //margin: EdgeInsets.only(top: 15),
                  height: 100,
                  width: MediaQuery.of(context).size.width - 30,
                  color: Colors.grey[400],
                  // for spacing of the words
                  padding: EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    child: ButtonTheme(
                      minWidth: 50,
                      height: 50,
                      child: ListTile(
                        //contentPadding: EdgeInsets.all(<some value here>),//change for side padding

                        title: Row(
                          children: <Widget>[
                            for (int i = 0; i < orderLinks.length; i++)
                            Expanded(child: RaisedButton(onPressed: () {},child: Text(orderLinks[i]), color: Colors.red[300],textColor: Colors.white,)),
                          ],
                        ),
                      )
                    )
                  )
                ),

                  Center(child:Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('Favorites',
                          style: TextStyle(fontSize: 22)))),

                  //for (int i = 0; i < blocks.length; i++)
                  Container(
                    //margin: EdgeInsets.only(top: 15),
                      height: 100,
                      width: MediaQuery.of(context).size.width - 30,
                      color: Colors.grey[400],
                      // for spacing of the words
                      padding: EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                          child: ButtonTheme(
                              minWidth: 50,
                              height: 50,
                              child: ListTile(
                                //contentPadding: EdgeInsets.all(<some value here>),//change for side padding

                                title: Row(
                                  children: <Widget>[
                                    for (int i = 0; i < favoriteLinks.length; i++)
                                      Expanded(child: RaisedButton(onPressed: () {},child: Text(favoriteLinks[i]), color: Colors.red[300],textColor: Colors.white,)),
                                  ],
                                ),
                              )
                          )
                      )
                  ),

                  Center(child:Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('Personal Information',
                          style: TextStyle(fontSize: 22)))),

                  //for (int i = 0; i < blocks.length; i++)
                  Container(
                    //margin: EdgeInsets.only(top: 15),
                      height: 100,
                      width: MediaQuery.of(context).size.width - 30,
                      color: Colors.grey[400],
                      // for spacing of the words
                      padding: EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                          child: ButtonTheme(
                              minWidth: 30,
                              height: 50,
                              child: ListTile(
                                //contentPadding: EdgeInsets.all(<some value here>),//change for side padding
                                title: Row(
                                  children: <Widget>[
                                    for (int i = 0; i < personalInfo.length; i++)
                                      Expanded(child: RaisedButton(onPressed: () {},child: Text(personalInfo[i], textAlign: TextAlign.center),
                                        color: Colors.red[300],textColor: Colors.white,)),
                                  ],
                                ),
                              )
                          )
                      )
                  ),

                  const Padding(padding: EdgeInsets.only(top: 20.0))

            ],
        ),
      ),
    );
  }
}