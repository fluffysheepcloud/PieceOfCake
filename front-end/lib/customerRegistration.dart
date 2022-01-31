import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    title: 'Navigation Basics',
    home: new CreateAccount(),
  ));
}

Widget _textStyles(String labelName){
  return
    Padding (
      padding: const EdgeInsets.symmetric( horizontal:15, vertical: 10),
      child:
      Align(
          alignment: Alignment.centerLeft,
          child: Text(
            labelName,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
          )
      )
    );


}

Widget _textBoxStyles(String hintTextInput){
  //List <String> labels = ['Username', 'Password', 'Re-enter Password', 'Email', 'Phone Number'];
  return Padding (

      padding: const EdgeInsets.symmetric( horizontal:15, vertical: 5),

      child:
          TextField(
          decoration: InputDecoration(
          border: const OutlineInputBorder(
          borderSide: BorderSide(
          width: 7,
          color: Colors.deepOrange,
          ),
          ),
          hintText: 'Enter ' +  hintTextInput,
          focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange))
          ),
          ),
  );
}

class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
          title: Text('Customer Registration'),
          titleTextStyle: TextStyle (color: Colors.white, fontWeight: FontWeight.bold),
          backgroundColor: Colors.brown[700],
        ),
        body: CreateAccountBody()
    );
  }
}

class CreateAccountBody extends StatelessWidget{

  // List <String> labels = ['Username', 'Password', 'Re-enter Password', 'Email', 'Phone Number'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //a column with children[<widget> , text button]
      //<widget> contains padding with a child column with children[label and textfield]
        child: Column(

            children: <Widget>[

              _textStyles('Username'),
              _textBoxStyles('Username'),
              _textStyles('Username'),
              _textBoxStyles('Username'),
              _textStyles('Re-enter Password'),
              _textBoxStyles('Re-enter Password'),
              _textStyles('Email'),
              _textBoxStyles('Email'),
              _textStyles('Phone Number'),
              _textBoxStyles('Phone Number'),
              // for (int i = 0; i <5; i++) Padding (
              //
              //     padding: const EdgeInsets.symmetric( horizontal:15, vertical: 5),
              //
              //     child: Column(
              //       children: [
              //         Padding(padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              //             child:
              //             Align(
              //                 alignment: Alignment.centerLeft,
              //                 child: Text(
              //                   labels[i].toString(),
              //                   textAlign: TextAlign.end,
              //                   overflow: TextOverflow.ellipsis,
              //                   style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
              //
              //                 )
              //             )
              //         ),
              //         TextField(
              //           decoration: InputDecoration(
              //               border: const OutlineInputBorder(
              //                 borderSide: BorderSide(
              //                   width: 7,
              //                   color: Colors.deepOrange,
              //                 ),
              //               ),
              //               hintText: 'Enter ' +  labels[i],
              //
              //               focusedBorder: const OutlineInputBorder(
              //                   borderSide: BorderSide(color: Colors.deepOrange))
              //           ),
              //         ),
              //       ],
              //     )
              // ),
              TextButton(
                style: TextButton.styleFrom
                  (backgroundColor: Colors.brown[700]),
                onPressed: (){
                  //TODO CUSTOMER HOME
                },
                child: Text(
                  'Register',
                  style: TextStyle( color: Colors.white, fontSize: 15),
                ),
              ),
            ]
        )
    );
  }
}