import 'package:chat_mit_sumaya/screens/chat_screen.dart';
import 'package:chat_mit_sumaya/services/auth.dart';
import 'package:chat_mit_sumaya/widgets/chat_button.dart';
import 'package:chat_mit_sumaya/widgets/chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {

  static const String ScreenRoute = 'register_screen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late  String email;
  late  String password;
  bool showSpin = false;
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpin,
        color: Colors.red[800]!,
        child: Padding(
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
                  color: Colors.red[200]!,
                  title: 'register',
                  onPressed: () async{
                    setState(() {
                      showSpin= true;
                    });
                     final user = await _auth.RegisterWithEmailAndPasword(email, password);
                     if(user !=null){
                       Navigator.pushNamed(context, ChatScreen.ScreenRoute);
                     }
                     setState(() {
                       showSpin = false;
                     });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
