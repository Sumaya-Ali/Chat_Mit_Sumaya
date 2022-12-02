import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {

  ChatTextField({required this.hintText,required this.withBorder, required this.onChange});

  final String hintText;
  final Function onChange;
  final bool withBorder;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      onChanged: (value) =>onChange ,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        border: withBorder == true ?  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ) : InputBorder.none,
        enabledBorder: withBorder == true ? OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red[300]!,
            width: 1,
          ),
        ) : null,
        focusedBorder: withBorder == true ? OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red[400]!,
            width: 2,
          ),
        ) : null,
      ),
    );
  }
}
