import 'package:flutter/material.dart';
import 'package:toku_app/components/list_item.dart';
import 'package:toku_app/models/item.dart';

class FamilyPage extends StatelessWidget {
  const FamilyPage({super.key});
  final List<Item> family = const [
    Item(
        sound: "father.wav",
        image: "assets/images/family_members/family_father.png",
        jpName: "otousan",
        enName: "Father"),
    Item(
        sound: "mother.wav",
        image: "assets/images/family_members/family_mother.png",
        jpName: "okaasan",
        enName: "Mother"),
    Item(
        sound: "daughter.wav",
        image: "assets/images/family_members/family_daughter.png",
        jpName: "musume",
        enName: "daughter"),
    Item(
        sound: "grand_father.wav",
        image: "assets/images/family_members/family_grandfather.png",
        jpName: "ojiisan",
        enName: "grandfather"),
    Item(
        sound: "grand_mother.wav",
        image: "assets/images/family_members/family_grandmother.png",
        jpName: "obaasan",
        enName: "grandmother"),
    Item(
        sound: "older_bother.wav",
        image: "assets/images/family_members/family_older_brother.png",
        jpName: "ani",
        enName: "older_brother"),
    Item(
        sound: "older_sister.wav",
        image: "assets/images/family_members/family_older_sister.png",
        jpName: "ane",
        enName: "older_sister"),
    Item(
        sound: "son.wav",
        image: "assets/images/family_members/family_son.png",
        jpName: "musuko",
        enName: "son"),
    Item(
        sound: "younger_brohter.wav",
        image: "assets/images/family_members/family_younger_brother.png",
        jpName: "otouto",
        enName: "younger_brother"),
    Item(
        sound: "younger_sister.wav",
        image: "assets/images/family_members/family_younger_sister.png",
        jpName: "imouto",
        enName: "youner_sister"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Family Members"),
        backgroundColor: Color(0xFF6b4226),
      ),
      body: ListView.builder(
        itemCount: family.length,
        itemBuilder: (context, index) => ListItem(
          item: family[index],
          backgroundColor: Color.fromARGB(200, 22, 202, 6),
          prefix: "sounds/family_members/",
        ),
      ),
    );
  }
}
