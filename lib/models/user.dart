import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  String email;
  String? name;
  String? photo;

  UserModel({
    required this.email,
    this.name,
    this.photo,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'photo': photo,
    };
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) :
    name = snapshot['name'],
    email = snapshot['email'],
    photo = snapshot['photo'];
}