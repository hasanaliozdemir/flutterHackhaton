import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  final CollectionReference usersCollection = FirebaseFirestore.instance.collection("users"); 
  Future updateUserData(String name, String email,int grade)async{
    return await usersCollection.doc(uid).set({
      'name' : name,
      'grade' : grade,
      'email' : email,
      "questions" : [],
      "loseSubjects" :  []
    });
  }
}