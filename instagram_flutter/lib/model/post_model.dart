import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String uid;
  final String postId;
  final String username;
  final String description;
  final String profImage;
  final String postUrl;
  final List likes;
  final DateTime datePublished;

  PostModel(
      {required this.uid,
      required this.postId,
      required this.username,
      required this.description,
      required this.profImage,
      required this.postUrl,
      required this.likes,
      required this.datePublished});
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "postId": postId,
        "profImage": profImage,
        "description": description,
        "postUrl": postUrl,
        "likes": likes,
        "datePublished": datePublished
      };
  factory PostModel.fromSnapshot(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;

    return PostModel(
        uid: snapShot["uid"],
        postId: snapShot["postId"],
        username: snapShot["username"],
        description: snapShot["description"],
        profImage: snapShot["profImage"],
        postUrl: snapShot["postUrl"],
        likes: snapShot["likes"],
        datePublished: snapShot["datePublished"]);
  }
}
