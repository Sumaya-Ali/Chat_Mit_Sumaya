import 'package:chat_mit_sumaya/services/database.dart';
import 'package:chat_mit_sumaya/widgets/message_line.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessagesStream extends StatelessWidget {
  const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    DatabaseService _database = DatabaseService();

    return StreamBuilder<QuerySnapshot>(
        stream: _database.messages,
        builder: (context,snapshot){

          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red[800]!,
              ),
            );
          }

          List<MessageLine> messagesWidgets = [];

          final messages = snapshot.data!.documents;

          for(var message in messages){

            final text = message['text'];
            final email = message['email'];

            final messageWidget = MessageLine(text: text,email: email,);
            messagesWidgets.add(messageWidget);
          }

          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              children: messagesWidgets,
            ),
          );

        });
  }
}
