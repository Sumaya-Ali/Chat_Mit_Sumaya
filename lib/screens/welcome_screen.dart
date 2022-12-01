import 'package:chat_mit_sumaya/widgets/chat_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            Column(
              children: [
                Container(
                  height: 180,
                  child: Image.asset('assets/logo1.png'),
                ),
                SizedBox(height: 10,),
                Text(
                  'Chat mit Sumaya',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Colors.red[400],
                    fontFamily: 'Shrikhand',
                  ),),
              ],
            ),
            SizedBox(height: 30,),
            ChatButton(color: Colors.red[800]!,title: 'Sign in',  onPressed: (){},),
            ChatButton(color: Colors.red[200]!,title: 'register', onPressed: (){},),
          ],
        ),
      ),
    );
  }
}
