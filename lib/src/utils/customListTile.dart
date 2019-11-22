import 'package:flutter/material.dart';

IconData icon;
String text;
Function onTap;
MaterialColor colors;

class CustomListTile extends StatelessWidget {
  const CustomListTile(icon, text, onTap, {colors, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Icon(
            icon,
            color: (colors != null ? colors : Colors.white),
            size: 60,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
