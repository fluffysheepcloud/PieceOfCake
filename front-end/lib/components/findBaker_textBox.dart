import 'package:flutter/material.dart';
//takes in label and controller then returns value
//main page will use this value for the query
//this should be a form since it has more than 1 value
class findBaker_textBox extends StatelessWidget{
  String _title;
  TextEditingController _tc;
  //TextEditingController _textControl;
  findBaker_textBox (this._title, this._tc); // this._textControl);

  @override
  Widget build(BuildContext context){
    //final TextEditingController tc = _textControl;
    return SizedBox(
      width: 400,
      child:Row(
          children:<Widget> [
            Container(
                height: 52,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.brown[200],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0)
                    )
                ),

                child: Align(
                  alignment: Alignment.center,
                  child: Text(_title),
                )
            ),
            Expanded(

                child: Container(
                    height: 52,
                    width: 100,
                  child: TextFormField(
                   controller: _tc,
                    validator: (value){
                     if (value != null){
                       return value.trim().isNotEmpty ? null: "$_title cannot be empty!";
                     }
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.brown),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber))
                    ),

                  ),
                )
            ),
            // TextFormField(
            //   controller: tc,
            //   validator: (value){
            //
            //   },
            //)
          ]
      ),
    );

  }
}

