import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String id = 'chatPage';
  final ScrollController _controller = ScrollController();

// This is what you're looking for!
  void _scrollDown() {
    _controller.animateTo(
      // _controller.position.maxScrollExtent,
      0,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessagesCollection);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(KCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(Message.fromJson(snapshot.data!.docs[i]));
            }

            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: KPrimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      KLogo,
                      height: 50,
                    ),
                    Text("Chat"),
                  ],
                ),
              ),
              body: Column(children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].id == email
                          ? ChatBuble(message: messageList[index])
                          : ChatBubleForFriend(message: messageList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({
                        KMessage: data,
                        KCreatedAt: DateTime.now(),
                        "id": email,
                      });
                      controller.clear();
                      _scrollDown();
                    },
                    decoration: InputDecoration(
                      hintText: "Send Message",
                      suffixIcon: Icon(
                        Icons.send,
                        color: KPrimaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: KPrimaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: KPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            );
          } else {
            return Text("Loading");
          }
        });
  }
}
