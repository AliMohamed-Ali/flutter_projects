import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:toku_app/models/phrases_item.dart';

class PhrasesList extends StatelessWidget {
  const PhrasesList(
      {super.key,
      required this.item,
      required this.backgroundColor,
      required this.prefix});
  // final Number number;
  final PhrasesItem item;
  final Color backgroundColor;
  final String prefix;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: backgroundColor,
      child: Row(
        children: [
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
                print(prefix + item.sound);

                final player = AudioPlayer();
                // player.play('black.wav'); //not working with me
                await player.play(AssetSource(prefix + item.sound));
                // player.clear(item.sound);
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
