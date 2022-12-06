import 'package:chat_mit_sumaya/services/auth.dart';
import 'package:chat_mit_sumaya/services/database.dart';
import 'package:chat_mit_sumaya/widgets/chat_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  static const String ScreenRoute = 'chat_screen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  AuthService _auth = AuthService();
  DatabaseService _database = DatabaseService();

  late String currentUserEmail;
  late String textMessage;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async{
    final user = await _auth.currentUser();
    if(user != null){
      currentUserEmail = user.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: Row(
          children: [
            Image.asset('assets/logo1.png',height: 50,),
            SizedBox(width:10,),
            Text('Chat mit Sumaya'),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () async{
                await _auth.signOut();
                Navigator.pop(context);
              },
              icon: Image.asset('assets/log_out.png',height: 30,),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: _database.messages,
                builder: (context,snapshot){

                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.red[800]!,
                      ),
                    );
                  }

                  List<Text> messagesWidgets = [];

                  final messages = snapshot.data!.documents;

                  for(var message in messages){

                    final text = message['text'];
                    final email = message['email'];

                    final messageWidget = Text('$text - $email');
                    messagesWidgets.add(messageWidget);
                  }

                  return Column(
                    children: messagesWidgets,
                  );

                }),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color:Colors.red[800]!,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ChatTextField(
                      obsecureText: false,
                      hintText: 'write your message here...',
                      withBorder: false,
                      onChange: (value){
                        textMessage = value;
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () async{
                      await _database.addMessage(textMessage, currentUserEmail);
                    },
                    icon: Image.asset('assets/send_message.png',height: 25,),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
