import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScholarChat());
}

class ScholarChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        ChatPage.id: (context) => ChatPage(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
