import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {

  ChatTextField({required this.hintText,required this.withBorder, required this.obsecureText, required this.onChange});

  final String hintText;
  final void Function(String)? onChange;
  final bool withBorder;
  final bool obsecureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      keyboardType: !obsecureText ? TextInputType.emailAddress: null,
      obscureText: obsecureText ? true:false,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        border: withBorder ?  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ) : InputBorder.none,
        enabledBorder: withBorder ? OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red[300]!,
            width: 1,
          ),
        ) : null,
        focusedBorder: withBorder ? OutlineInputBorder(
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
