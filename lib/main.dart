import 'package:chat_mit_sumaya/screens/chat_screen.dart';
import 'package:chat_mit_sumaya/screens/register_screen.dart';
import 'package:chat_mit_sumaya/screens/signin_screen.dart';
import 'package:chat_mit_sumaya/screens/welcome_screen.dart';
import 'package:chat_mit_sumaya/services/auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  AuthService _auth = AuthService();
  String currentUserEmail ='';
  bool getCurrentUser_isDone = false;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() async{
     final user = await _auth.currentUser();
     if(user != null){
       setState(() {
         currentUserEmail = user.email;
       });
     }
     setState(() {
       getCurrentUser_isDone = true;
     });
   }

  @override
  Widget build(BuildContext context) {
    return !getCurrentUser_isDone ? Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.red[800]!,
        color: Colors.red[200],
      ),
    ): MaterialApp(
       title: 'Chat mit Sumaya',
       theme: ThemeData(

         primarySwatch: Colors.blue,
       ),
     //  home: ChatScreen(),
       initialRoute: currentUserEmail == ''? WelcomeScreen.ScreenRoute : ChatScreen.ScreenRoute,
       routes: {
         WelcomeScreen.ScreenRoute : (context) => WelcomeScreen(),
         SignInScreen.ScreenRoute : (context) => SignInScreen(),
         RegisterScreen.ScreenRoute : (context) => RegisterScreen(),
         ChatScreen.ScreenRoute : (context) => ChatScreen(),
       },
     );
  }
}