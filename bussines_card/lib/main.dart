import 'package:flutter/material.dart';

void main() {
  runApp(const BussinesCardApp());
}

class BussinesCardApp extends StatelessWidget {
  const BussinesCardApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF2B475E),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 90,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 88,
                backgroundImage: AssetImage("images/profile.webp"),
              ),
            ),
            const Text(
              "Ali Mohamed",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Pacifico',
              ),
            ),
            const Text(
              "FLUTTER DEVELOPER",
              style: TextStyle(
                  color: Color(0xFF6C8090),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(
              color: Color(0xFF6C8090),
              thickness: 1,
              indent: 60,
              endIndent: 60,
              height: 10,
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: const ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 32,
                  color: Color(0xFF2B475E),
                ),
                title: Text(
                  "(+01) 2045678",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: const ListTile(
                leading: Icon(
                  Icons.mail,
                  size: 32,
                  color: Color(0xFF2B475E),
                ),
                title: Text(
                  "elsayedali@gmail.com",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
