import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:toku_app/models/item.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {super.key,
      required this.item,
      required this.backgroundColor,
      required this.prefix});
  // final Number number;
  final Item item;
  final Color backgroundColor;
  final String prefix;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: backgroundColor,
      child: Row(
        children: [
          Container(color: Color(0xfffff6Dc), child: Image.asset(item.image)),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.jpName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  item.enName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Spacer(flex: 1),
          IconButton(
            onPressed: () async {
              try {
                // AudioCache player = AudioCache(prefix: prefix);
                final player = AudioPlayer();
                // player.play('black.wav'); //not working with me
                await player.play(AssetSource(prefix + item.sound));
                // player.clear(item.sound);
                print(item.sound);
              } catch (ex) {
                print(ex);
              }
            },
            icon: Icon(
              Icons.play_arrow,
              size: 32,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
