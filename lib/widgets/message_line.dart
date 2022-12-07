import'package:flutter/material.dart';

class MessageLine extends StatelessWidget {
  const MessageLine({Key? key, this.text,this.email}) : super(key: key);

  final String? text;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('$email',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black45,
          ),),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            color: Colors.red[800],
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text(
                '$text',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),),
            ),
          ),
        ],
      ),
    );
  }
}
