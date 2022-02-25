import 'package:flutter/material.dart';
import 'package:frontend/utils/shared_preferences.dart';

class MerchantProfile extends StatelessWidget {
  const MerchantProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('[MERCHANT]\'s Profile'),
        backgroundColor: Colors.red[100],
        toolbarHeight: 50,
      ),
      body: MerchantProfileBody(),);
  }
}

class MerchantProfileBody extends StatelessWidget {
  // shop manager page will include editing shop name, shop description, business hours,
  // create new cake products (also listed here for convenience)

  List<String> orderLinks = [
    // received_order.dart page
    'New Orders',
    // progress tracker, have capability to cancel a customer order
    'Current Orders',
    // completed orders, with each order, have the option to look at review specific to the order
    'Past Orders'
  ];

  List<String> cakeLinks = [
    // link to a list of cake products the merchant made
    'My Cakes',
    // reviews only
    'Reviews'
  ];

  // edit personal info
  List<String> personalInfo = [
    'Change Nickname',
    'Change Password',
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
                      image: NetworkImage('https://i.ibb.co/ch493wz/cakes.jpg'),
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
                    backgroundImage: NetworkImage('https://i.ibb.co/FJdLdg8/avatar.jpg'),
                    radius: 60.0,
                  ),
                ),
              ),
            ),

            //for spacing under the avatar
            const Padding(padding: EdgeInsets.only(top: 70.0)),

            // edit shop profile button
            ElevatedButton(
              style: ButtonStyle (
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade400),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                      )
                  )
              ),

              // TODO: Make a shop manager page
              onPressed: () {},
              child: Text("Shop Manager", style: const TextStyle(fontSize: 20)),
            ),

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
                                Expanded(child: RaisedButton(onPressed: () {},child: Text(orderLinks[i], textAlign: TextAlign.center), color: Colors.red[300],textColor: Colors.white,)),
                            ],
                          ),
                        )
                    )
                )
            ),

            Center(child:Container(
                padding: EdgeInsets.only(top: 20),
                child: Text('My Cakes',
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
                              for (int i = 0; i < cakeLinks.length; i++)
                                Expanded(child: RaisedButton(onPressed: () {},child: Text(cakeLinks[i], textAlign: TextAlign.center), color: Colors.red[300],textColor: Colors.white,)),
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

            const Padding(padding: EdgeInsets.only(top: 20.0)),

            ElevatedButton(
              style: ButtonStyle (
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade400),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                      )
                  )
              ),
              onPressed: () {
                SPUtil.remove("merchant");
                Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
              },
              child: Text("LOG OUT"),
            )
          ],
        ),
      ),
    );
  }

}