import 'package:chat_mit_sumaya/widgets/chat_button.dart';
import 'package:chat_mit_sumaya/widgets/chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterScreen extends StatefulWidget {

  static const String ScreenRoute = 'register_screen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Image.asset('assets/logo1.png'),
              height: 180,
            ),
            SizedBox(height: 50,),
            ChatTextField(hintText: 'Enter your email', withBorder: true, onChange: (){}),
            SizedBox(height: 8,),
            ChatTextField(hintText: 'Enter your password', withBorder: true, onChange: (){}),
            SizedBox(height: 10,),
            ChatButton(
                color: Colors.red[200]!,
                title: 'register',
                onPressed: (){})
          ],
        ),
      ),
    );
  }
}
