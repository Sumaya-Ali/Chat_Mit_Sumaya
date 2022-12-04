import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future RegisterWithEmailAndPasword (String email,String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //return _userFromFirebaseUser(user);
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future SignInWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //return _userFromFirebaseUser(user);
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  Future signOut() async {
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  Future currentUser() async{
    try{
      final user =  await _auth.currentUser();
      return user;
  }
  catch(e){
      print(e.toString());
      return null;
  }
}

}