import 'package:bloc/bloc.dart';
import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<Message> messageList = [];

  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessagesCollection);
  void sendMessage({required String message, required String email}) {
    try {
      messages.add({
        KMessage: message,
        KCreatedAt: DateTime.now(),
        "id": email,
      });
    } on Exception catch (e) {
      // TODO
    }
  }

  void getMessage() {
    messages.orderBy(KCreatedAt, descending: true).snapshots().listen((event) {
      messageList.clear();
      for (int i = 0; i < event.docs.length; i++) {
        messageList.add(Message.fromJson(event.docs[i]));
      }
      emit(ChatSuccess(messages: messageList));
    });
  }
}
