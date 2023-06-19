import 'package:flutter/material.dart';
import 'package:toku_app/components/list_item.dart';
import 'package:toku_app/models/item.dart';

class NumberPage extends StatelessWidget {
  const NumberPage({super.key});

  final List<Item> numbers = const [
    Item(
        sound: "number_one_sound.mp3",
        image: "assets/images/numbers/number_one.png",
        jpName: "ichi",
        enName: "one"),
    Item(
        sound: "number_two_sound.mp3",
        image: "assets/images/numbers/number_two.png",
        jpName: "Ni",
        enName: "two"),
    Item(
        sound: "number_three_sound.mp3",
        image: "assets/images/numbers/number_three.png",
        jpName: "san",
        enName: "three"),
    Item(
        sound: "number_four_sound.mp3",
        image: "assets/images/numbers/number_four.png",
        jpName: "yon",
        enName: "four"),
    Item(
        sound: "number_five_sound.mp3",
        image: "assets/images/numbers/number_five.png",
        jpName: "go",
        enName: "five"),
    Item(
        sound: "number_six_sound.mp3",
        image: "assets/images/numbers/number_six.png",
        jpName: "roku",
        enName: "six"),
    Item(
        sound: "number_seven_sound.mp3",
        image: "assets/images/numbers/number_seven.png",
        jpName: "nana",
        enName: "seven"),
    Item(
        sound: "number_eight_sound.mp3",
        image: "assets/images/numbers/number_eight.png",
        jpName: "hachi",
        enName: "eight"),
    Item(
        sound: "number_nine_sound.mp3",
        image: "assets/images/numbers/number_nine.png",
        jpName: "kyuu",
        enName: "nine"),
    Item(
        sound: "number_ten_sound.mp3",
        image: "assets/images/numbers/number_ten.png",
        jpName: "jyuu",
        enName: "ten"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Numbers"),
        backgroundColor: Color(0xFF6b4226),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) => ListItem(
          item: numbers[index],
          backgroundColor: Color(0xffEF9235),
          prefix: "sounds/numbers/",
        ),
      ),
    );
  }

  // List<Widget> getList(List<Number> numbers) {
  //   List<Widget> listItem = [];
  //   for (int i = 0; i < numbers.length; i++) {
  //     listItem.add(Item(number: numbers[i]));
  //   }
  //   return listItem;
  // }
}
