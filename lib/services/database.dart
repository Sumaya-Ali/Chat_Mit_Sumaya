import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final CollectionReference messagesCollection = Firestore.instance.collection('message');

  Future addMessage(String text, String email) async{
    return await messagesCollection.add({
      'text' : text,
      'email' : email,
    });
  }
}