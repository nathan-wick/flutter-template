import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class DatabaseService {
  final database = FirebaseFirestore.instance;

  Future<void> updateUser(UserModel user) async {
    final userAuthentication = FirebaseAuth.instance.currentUser;
    final userReference = database.collection("users").doc(userAuthentication?.uid);

    await userReference.set(user.toJson(), SetOptions(merge: true));
  }

  Future<UserModel> createUser() async {
    final userAuthentication = FirebaseAuth.instance.currentUser;
    final user = UserModel(
      name: userAuthentication?.displayName,
      email: userAuthentication?.email ?? '', // TODO: Throw error if email is missing
      photo: userAuthentication?.photoURL,
    );

    await updateUser(user);

    return user;
  }

  Future<UserModel> getUser() async {
    final userAuthentication = FirebaseAuth.instance.currentUser;
    final userReference = database.collection("users").doc(userAuthentication?.uid);
    final userSnapshot = await userReference.get();

    if (userSnapshot.exists) {
      return UserModel.fromDocumentSnapshot(userSnapshot);
    } else {
      return await createUser();
    }
  }
}