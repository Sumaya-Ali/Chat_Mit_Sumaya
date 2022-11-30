import 'package:flutter/material.dart';

class ChatButton extends StatelessWidget {
  ChatButton({required this.color,required this.title,required this.fontFamily, required this.onPressed});

  final Color color;
  final String title;
  final String fontFamily;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: ()=> onPressed,
          minWidth: 200,
          height: 42,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
