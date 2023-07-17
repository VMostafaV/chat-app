import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {super.key,
      required this.color,
      required this.onPressed,
      required this.title});
  Color color;
  String title;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        height: 70,
        width: 280,
        decoration: BoxDecoration(boxShadow: const <BoxShadow>[
          BoxShadow(
              offset: Offset(-2, 10),
              blurRadius: 10,
              spreadRadius: 1,
              color: Color.fromARGB(57, 0, 0, 0))
        ], color: color, borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
