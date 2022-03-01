import 'package:flutter/material.dart';

class ProfileBlock extends StatelessWidget {

  final String _blockTitle;
  final List<String> _blockItems;
  final List<String> _routes;
  final VoidCallback setState;

  const ProfileBlock(this._blockTitle, this._blockItems, this._routes, this.setState, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          // block title
          Text(
            _blockTitle,
            style: TextStyle(fontSize: 22)
          ),
          SizedBox(height: 5),
          // show block items
          Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10)
            ),

            // for spacing of the words
            child: Row(
              // evenly seperate items
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                for (int i = 0; i < _blockItems.length; i++)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, _routes[i]).then((res) => setState());
                    },
                    child: Text(_blockItems[i]),
                    style: _buttonStyle(),
                  ),
              ],
            )
          ),
        ],
      ),
    );
  }

  _buttonStyle() {
    return ElevatedButton.styleFrom(
        primary: Colors.red[300],
        textStyle: TextStyle(
            color: Colors.white,
            fontSize: 14
        ),
        fixedSize: Size(100, 50)
    );
  }

}

