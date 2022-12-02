import 'package:chat_mit_sumaya/widgets/chat_text_field.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  static const String ScreenRoute = 'chat_screen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
              onPressed: (){},
              icon: Image.asset('assets/log_out.png',height: 30,),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(),
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
                      hintText: 'write your message here...',
                      withBorder: false,
                      onChange: (){},
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
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
