import'package:flutter/material.dart';

class MessageLine extends StatelessWidget {
  const MessageLine({Key? key, this.text,this.email,required this.isMe}) : super(key: key);

  final String? text;
  final String? email;

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end: CrossAxisAlignment.start,
        children: [
          Text('$email',
          style: TextStyle(
            fontSize: 12,
            color: Colors.red[200],
          ),),
          Material(
            elevation: 5,
            borderRadius: isMe ? BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ) : BorderRadius.only(
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            color: isMe? Colors.red[800]: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text(
                '$text',
                style: TextStyle(
                  fontSize: 15,
                  color: isMe? Colors.white : Colors.red[400],
                ),),
            ),
          ),
        ],
      ),
    );
  }
}
