import 'package:flutter/material.dart';
import 'package:toku_app/components/list_item.dart';
import 'package:toku_app/models/item.dart';

class ColorPage extends StatelessWidget {
  const ColorPage({super.key});
  final List<Item> colors = const [
    Item(
        sound: "black.wav",
        image: "assets/images/colors/color_black.png",
        jpName: "otousan",
        enName: "black"),
    Item(
        sound: "brown.wav",
        image: "assets/images/colors/color_brown.png",
        jpName: "otousan",
        enName: "brown"),
    Item(
        sound: "dusty yellow.wav",
        image: "assets/images/colors/color_dusty_yellow.png",
        jpName: "otousan",
        enName: "dusty_yellow"),
    Item(
        sound: "gray.wav",
        image: "assets/images/colors/color_gray.png",
        jpName: "otousan",
        enName: "gray"),
    Item(
        sound: "green.wav",
        image: "assets/images/colors/color_green.png",
        jpName: "otousan",
        enName: "green"),
    Item(
        sound: "red.wav",
        image: "assets/images/colors/color_red.png",
        jpName: "otousan",
        enName: "red"),
    Item(
        sound: "white.wav",
        image: "assets/images/colors/color_white.png",
        jpName: "otousan",
        enName: "white"),
    Item(
        sound: "yellow.wav",
        image: "assets/images/colors/yellow.png",
        jpName: "otousan",
        enName: "yellow"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Colors"),
        backgroundColor: Color(0xFF6b4226),
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) => ListItem(
          item: colors[index],
          backgroundColor: Color.fromARGB(255, 169, 9, 209),
          prefix: "sounds/colors/",
        ),
      ),
    );
  }
}
