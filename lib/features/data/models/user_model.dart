import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String contact;
  String carName;
  String email;
  String password;

  UserModel(
      {required this.name,
      required this.contact,
      required this.carName,
      required this.email,
        required this.password});

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return UserModel(
      name: data['name'],
      contact: data['contact'],
      carName: data['carName'],
      email: data['email'],
        password : data['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'contact': contact,
      'carName': carName,
      'email': email,
      'password' : password
    };
  }
}
