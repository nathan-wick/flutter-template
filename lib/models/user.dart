import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  final String email;
  final String photo;

  User({
    required this.name,
    required this.email,
    required this.photo,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'photo': photo,
    };
  }

  User.fromDocumentSnapshot(DocumentSnapshot snapshot)
    : name = snapshot['name'],
      email = snapshot['email'],
      photo = snapshot['photo'];
}