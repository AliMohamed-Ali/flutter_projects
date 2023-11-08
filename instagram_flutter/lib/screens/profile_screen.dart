import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/resources/auth_method.dart';
import 'package:instagram_flutter/resources/firebase_method.dart';
import 'package:instagram_flutter/screens/login_screens.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/follow_button.dart';

class ProfileScreen extends StatefulWidget {
  final uid;
  const ProfileScreen({super.key, required this.uid});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userData = {};
  int postCount = 0;
  int followers = 0;
  int following = 0;

  bool isFollowers = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    var user = await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.uid)
        .get();
    var postNumber = await FirebaseFirestore.instance
        .collection("posts")
        .where("uid", isEqualTo: widget.uid)
        .get();
    postCount = postNumber.docs.length;

    userData = user.data()!;
    followers = userData["followers"].length;
    following = userData["following"].length;
    isFollowers =
        userData["followers"].contains(FirebaseAuth.instance.currentUser!.uid);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text(
          "${userData["username"]}",
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(userData["photoUrl"]),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    buildStatColumn(
                                        num: followers, label: "followers"),
                                    buildStatColumn(
                                        num: following, label: "following"),
                                    buildStatColumn(
                                        num: postCount, label: "posts"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FirebaseAuth.instance.currentUser!.uid ==
                                            widget.uid
                                        ? FollowButton(
                                            backgroundColor:
                                                mobileBackgroundColor,
                                            borderColor: Colors.grey,
                                            text: "Sign Out",
                                            textColor: primaryColor,
                                            function: () async {
                                              await AuthMethods().signOut();
                                              Navigator.of(context).pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LoginScreen()));
                                            },
                                          )
                                        : isFollowers
                                            ? FollowButton(
                                                backgroundColor: Colors.white,
                                                borderColor: Colors.grey,
                                                text: "Unfollow",
                                                textColor: Colors.black,
                                                function: () async {
                                                  await FirebaseMethod()
                                                      .followUpdate(
                                                          uid: FirebaseAuth
                                                              .instance
                                                              .currentUser!
                                                              .uid,
                                                          followId:
                                                              userData["uid"]);
                                                  setState(() {
                                                    isFollowers = false;
                                                    followers--;
                                                  });
                                                },
                                              )
                                            : FollowButton(
                                                backgroundColor: blueColor,
                                                borderColor: Colors.grey,
                                                text: "Follow",
                                                textColor: Colors.white,
                                                function: () async {
                                                  await FirebaseMethod()
                                                      .followUpdate(
                                                          uid: FirebaseAuth
                                                              .instance
                                                              .currentUser!
                                                              .uid,
                                                          followId:
                                                              userData["uid"]);
                                                  setState(() {
                                                    isFollowers = true;
                                                    followers++;
                                                  });
                                                },
                                              ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          userData["username"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 1),
                        child: Text(
                          userData["bio"],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('posts')
                      .where("uid", isEqualTo: widget.uid)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 1.5,
                              childAspectRatio: 1),
                      itemBuilder: (context, index) {
                        return Container(
                          child: Image(
                            image: NetworkImage(
                                snapshot.data!.docs[index].data()["postUrl"]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
    );
  }

  Column buildStatColumn({required int num, required String label}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$num",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
