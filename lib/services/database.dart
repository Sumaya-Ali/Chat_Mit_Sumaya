import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final CollectionReference messagesCollection = Firestore.instance.collection('message');

  Future addMessage(String text, String email,FieldValue time) async{
    return await messagesCollection.add({
      'text' : text,
      'email' : email,
      'time' : time,
    });
  }

  Stream<QuerySnapshot> get messages {
    return messagesCollection.orderBy('time') .snapshots();
  }
}