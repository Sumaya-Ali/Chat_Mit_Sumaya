import 'package:chat_mit_sumaya/screens/chat_screen.dart';
import 'package:chat_mit_sumaya/services/auth.dart';
import 'package:chat_mit_sumaya/widgets/chat_button.dart';
import 'package:chat_mit_sumaya/widgets/chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInScreen extends StatefulWidget {

  static const String ScreenRoute = 'signin_screen';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  late String email;
  late String password;

  AuthService _auth = AuthService();

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
            ChatTextField(
                obsecureText: false,
                hintText: 'Enter your email',
                withBorder: true,
                onChange: (value){
                    email = value;
                }),
            SizedBox(height: 8,),
            ChatTextField(
                obsecureText: true,
                hintText: 'Enter your password',
                withBorder: true,
                onChange: (value){
                    password=value;
                }),
            SizedBox(height: 10,),
            ChatButton(
                color: Colors.red[800]!,
                title: 'Sign in',
                onPressed: () async{
                 final user = await _auth.SignInWithEmailAndPassword(email, password);
                 if (user !=null){
                   Navigator.pushNamed(context, ChatScreen.ScreenRoute);
                 }
                })
          ],
        ),
      ),
    );
  }
}
