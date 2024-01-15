

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core.exceptions/auth_exception.dart';
import '../models/user_model.dart';

class AuthDataSource{
  AuthDataSource(this._auth);

  final FirebaseAuth _auth;


  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<void> addUser(UserModel userModel) async{
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    try {

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: userModel.email, password: userModel.password);
      // Convert StationModel object to a map
      Map<String, dynamic> data = userModel.toMap();
      String id = userCredential.user!.uid;
      // Add data to Firestore
      await firebaseFirestore.collection('users').doc(id).set(data);
      signInWithEmailAndPassword(userModel.email, userModel.password);
    } catch (error) {
      // Handle errors here
      print('Error adding data to Firestore: $error');
    }


  }

  Future<UserModel> getCurrentUser() async{
    try {
      User? user = _auth.currentUser;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      DocumentSnapshot userDoc = await firebaseFirestore.collection('users')
          .doc(user!.uid)
          .get();
      if (userDoc.exists) {
        UserModel userModel = UserModel.fromFirestore(userDoc);
        return userModel;
      } else {
        return UserModel(name: 'Dummy', contact: '12345678', carName: 'Dummy', email: 'dummy', password: 'dummy');
      }
    } catch (e) {
      print(e.toString());
    }
    return UserModel(name: 'Dummy', contact: '12345678', carName: 'Dummy', email: 'dummy', password: 'dummy');
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {

    try{
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;

    }on FirebaseAuthException catch(e){
      // print('error');
      print(e.code);
      print(e.code == 'invalid-credential');

      if(e.code=='user-not-found'){
        throw AuthException('User Not Found');
      } else if(e.code == 'wrong password'){
        throw AuthException('Wrong Password');
      } else if(e.code == 'invalid-credential'){
        throw AuthException('invalid Credential');
      } else {
        throw AuthException(e.toString());
      }

    }
  }

  Future<void> signOut() async{
    await _auth.signOut();
  }


}