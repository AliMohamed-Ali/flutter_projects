import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';
import 'color_item.dart';

class EditNotesColorList extends StatefulWidget {
  const EditNotesColorList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNotesColorList> createState() => _EditNotesColorListState();
}

class _EditNotesColorListState extends State<EditNotesColorList> {
  late int currentIndex;
  @override
  void initState() {
    // TODO: implement initState
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.note.color = kColors[index].value;
              setState(() {});
            },
            child: CustomCircleColor(
              isActive: currentIndex == index,
              color: kColors[index],
            ),
          ),
        ),
      ),
    );
  }
}
