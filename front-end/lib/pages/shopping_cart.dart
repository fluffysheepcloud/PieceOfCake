import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
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
              _payButton(),

            ],
          ),
        )
    );
  }

  _headSection() {
    return Container(
      height: 115,
      color: Colors.deepOrange[900],
      child: Stack(
        children: [
          _topBackground(),
          //
        ],
      ),
    );
  }
  _payButton(){
    return Positioned(
      bottom: 0,
      right: 120,
      child: Container(
        height: 50,
        width: 150,
        child: ElevatedButton(
          child: Text("PAY"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepOrange[900]),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25)),
              shape: MaterialStateProperty.all(BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)))
          ),
          onPressed: (){},
        ),

      ),
    );

  }
  //put background image in here
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
      top: 100,
      left: 0,
      right: 0,
      bottom: 0,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          //can get how many items in here
          itemCount: 3,
          itemBuilder: (_, index){
            return Container(
              margin: const EdgeInsets.only(top:20),
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
                    //Item pic, Item name, and Item Detail
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
                                        ""
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
                    //Remove button, Subtotal and price
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 85,
                              height: 30,
                              child: ElevatedButton(
                                child: Text("Remove"),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange[900]),
                                    shape: MaterialStateProperty.all(BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)))
                                ),
                                onPressed: (){},
                              ),
                            ),
                            Expanded(child: Container(

                            )),
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
                            SizedBox(
                              height: 15
                              ,
                            )

                          ],
                        ),
                        SizedBox(
                          width: 10,),
                      ],

                    ),
                  ],
                ),

              ),

            );
          },
        ),
      ),

    );
  }
}
