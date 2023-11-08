import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_flutter/model/post_model.dart';
import 'package:instagram_flutter/resources/stroge_methods.dart';
import 'package:uuid/uuid.dart';

class FirebaseMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final StrogeMethod strogeMethod = StrogeMethod();

  Future<String> uploadPost(
      {required String username,
      required String profImage,
      required String uid,
      required String description,
      required Uint8List file}) async {
    String res = "Some thing went wrong";
    try {
      String postId = const Uuid().v1();
      String postUrl =
          await strogeMethod.uploadImageToFireStroe("posts", file, true);
      PostModel post = PostModel(
          uid: uid,
          postId: postId,
          username: username,
          description: description,
          profImage: profImage,
          postUrl: postUrl,
          likes: [],
          datePublished: DateTime.now());
      await _firestore.collection("posts").doc(postId).set(post.toJson());
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection("posts").doc(postId).update({
          "likes": FieldValue.arrayRemove([uid]),
        });
      } else {
        await _firestore.collection("posts").doc(postId).update({
          "likes": FieldValue.arrayUnion([uid]),
        });
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  Future<void> postComment(String postId, String username, String profilePic,
      String commentText, String uid) async {
    try {
      if (commentText.isNotEmpty) {
        String commentId = const Uuid().v1();
        await _firestore
            .collection("posts")
            .doc(postId)
            .collection("comments")
            .doc(commentId)
            .set({
          "username": username,
          "uid": uid,
          "profilePic": profilePic,
          "comment": commentText,
          "commentDate": DateTime.now(),
        });
        print("Done ");
      } else {
        print("comment is empty");
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection("posts").doc(postId).delete();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> followUpdate(
      {required String uid, required String followId}) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(uid).get();
      List following = (snap.data()! as dynamic)["following"];
      if (following.contains(followId)) {
        await _firestore.collection("users").doc(followId).update({
          'followers': FieldValue.arrayRemove([uid]),
        });

        await _firestore.collection("users").doc(uid).update({
          'following': FieldValue.arrayRemove([followId]),
        });
      } else {
        await _firestore.collection("users").doc(followId).update({
          'followers': FieldValue.arrayUnion([uid]),
        });

        await _firestore.collection("users").doc(uid).update({
          'following': FieldValue.arrayUnion([followId]),
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
