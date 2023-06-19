import 'package:flutter/material.dart';
import 'package:toku_app/models/phrases_item.dart';
import '../components/phrases_list.dart';

class PhrasesPage extends StatelessWidget {
  const PhrasesPage({super.key});
  final List<PhrasesItem> phrases = const [
    PhrasesItem(
        sound: "areyoucoming.wav",
        jpName: "Anata wa kite imasu",
        enName: "are_you_coming"),
    PhrasesItem(
        sound: "dont_forget_to_subscribe.wav",
        jpName: "Kōdoku o wasurenaide kudasai",
        enName: "dont_forget_to_subscribe"),
    PhrasesItem(
        sound: "how_are_you_feeling.wav",
        jpName: "Go kibun wa ikagadesu ka",
        enName: "how_are_you_feeling"),
    PhrasesItem(
        sound: "i_love_anime.wav",
        jpName: "Watashi wa anime ga daisukidesu",
        enName: "i_love_anime"),
    PhrasesItem(
        sound: "programming_is_easy.wav",
        jpName: "Puroguramingu wa kantandesu",
        enName: "programming_is_easy"),
    PhrasesItem(
        sound: "what_is_your_name.wav",
        jpName: "Namae wa nandesu ka",
        enName: "what_is_your_name"),
    PhrasesItem(
        sound: "where_are_you_going.wav",
        jpName: "Doko ni iku no",
        enName: "where_are_you_going"),
    PhrasesItem(
        sound: "yes_im_coming.wav",
        jpName: "Hai, kimasu",
        enName: "yes_im_coming"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phrases"),
        backgroundColor: Color(0xFF6b4226),
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) => PhrasesList(
          item: phrases[index],
          backgroundColor: Color.fromARGB(255, 8, 214, 221),
          prefix: "sounds/phrases/",
        ),
      ),  
    );
  }
}
