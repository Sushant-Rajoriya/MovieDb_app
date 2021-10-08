import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  const MyTextField({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            hintText: labelText,
            hintStyle: TextStyle(fontSize: 20.0, color: Colors.white60),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            )),
      ),
    );
  }
}
