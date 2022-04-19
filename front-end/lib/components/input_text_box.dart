import 'package:flutter/material.dart';

class InputTextBox extends StatelessWidget {

  String _labelName;
  String _hintText;
  TextEditingController _controller;
  bool obscure;

  InputTextBox(this._labelName, this._hintText, this._controller, {this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _labelName,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _controller,
              decoration: _generateInputDecoration(_hintText),
              obscureText: obscure,
              validator: (value) {
                if (value != null) {
                  return value.trim().isNotEmpty ? null : "${_labelName} can not be empty!";
                }
              },
            )
          ],
        ),
      ),
    );
  }


  _generateInputDecoration(String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 7,
            color: Colors.deepOrange,
          ),
        ),
        hintText: 'Enter ' + hintText,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange))
    );
  }

}
