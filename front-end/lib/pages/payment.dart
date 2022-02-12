import 'package:flutter/material.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  @override
  Widget build(BuildContext context) {
    double hi = MediaQuery
        .of(context)
        .size
        .height;
    double wi = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
        backgroundColor: Colors.deepOrange[100],
        appBar: AppBar(title: Text("Payment")),
        body: Container(
          height: hi,
          child: Stack(
            children: [
              _headSection(),
              _listItems(),

            ],
          ),
        )
    );
  }

  _headSection() {
    return Container(
      height: 180,
      color: Colors.deepOrange[900],
      child: Stack(
        children: [
          _topBackground(),
          _buttonContainer(),
        ],
      ),
    );
  }
  _buttonContainer(){
    return Positioned(
      right: 50,
        bottom: 0,
        child: Container(

          height: 50,
          width: 50,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "images/paymentButton.png"
                  )
              ),

              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0,1)

                )
              ]
          ),
        )
    );
  }
  _topBackground() {
    return Positioned(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                    //put background image in here
                      ""
                  )
              )
          ),
        )
    );
  }
  _listItems(){
    return Positioned(
        top: 190,
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width-15,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10)
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(1,1),
                blurRadius: 20.0,
              )
            ]
          ),
          child: Container(
            margin: const EdgeInsets.only(top:10, left:18),
            child: Row(
              //"remove" button location
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(

                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),
                              image: DecorationImage(
                                //put Item image in here
                                  image: AssetImage(
                                      "images/paymentButton.png"
                                  )
                              ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Item Name:",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.deepOrange[900],
                              fontWeight: FontWeight.w700
                            ),
                            ),
                            Text("Item Detail: ",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w300
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              "Remove",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Subtotal:",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black38
                          ),
                        ),
                        Text(
                          "\$price here",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Colors.black
                          ),
                        ),


                      ],
                    )
                  ],

                ),
              ],
            ),

          ),

    )
    );
  }

}