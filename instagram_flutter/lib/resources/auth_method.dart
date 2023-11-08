import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_flutter/model/user_model.dart';
import 'package:instagram_flutter/resources/stroge_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();
    return UserModel.fromSnapshot(snap);
  }

  Future<String> signUp({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "some thing went errro";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl = await StrogeMethod()
            .uploadImageToFireStroe("profilePick", file, false);
        UserModel user = UserModel(
            uid: cred.user!.uid,
            email: email,
            username: username,
            bio: bio,
            photoUrl: photoUrl,
            followers: [],
            following: []);

        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());

        res = "Success";
      } else {
        res = "Please fill all fields.";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        res = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        res = 'The email address is badly formatted.';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    String res = "Some thing went error";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        res = "Success";
      } else {
        res = "Please fill all fields.";
      }
      // } on FirebaseAuthException catch (e) {
      //   if (e.code == 'user-not-found') {
      //     res = 'No user found for that email.';
      //   } else if (e.code == 'wrong-password') {
      //     res = 'Wrong password provided for that user.';
      //   }
      //   print(e.toString());
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

Future<void> signOut()async{
 await _auth.signOut();
}
}
