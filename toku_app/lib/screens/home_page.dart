import 'package:toku_app/screens/family_page.dart';
import 'package:toku_app/screens/numbers_page.dart';
import 'package:toku_app/screens/phrases.dart';

import '../components/category_item.dart';
import 'package:flutter/material.dart';

import 'colors_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcaaf7e),
      appBar: AppBar(
        backgroundColor: Color(0xFF6b4226),
        title: Text("Toku"),
      ),
      body: Column(
        children: [
          Category(
            text: "Numbers",
            color: Color(0xffEF9235),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NumberPage();
              }));
            },
          ),
          Category(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FamilyPage();
                }));
              },
              text: "FamilyMembers",
              color: Color.fromARGB(200, 22, 202, 6)),
          Category(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ColorPage();
                }));
              },
              text: "Colors",
              color: Color.fromARGB(255, 169, 9, 209)),
          Category(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PhrasesPage();
                }));
              },
              text: "Phrasses",
              color: Color.fromARGB(255, 8, 214, 221)),
        ],
      ),
    );
  }
}
