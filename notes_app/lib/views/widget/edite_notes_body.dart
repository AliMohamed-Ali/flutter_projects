import 'package:flutter/material.dart';
import 'package:notes_app/views/widget/custom_app_bar.dart';
import 'package:notes_app/views/widget/custom_text_field.dart';

class EditeNoteBody extends StatelessWidget {
  const EditeNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: "EditeNote",
            icon: Icons.check,
          ),
          SizedBox(
            height: 32,
          ),
          CustomTextField(hint: "title"),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: "content",
            maxLines: 5,
          )
        ],
      ),
    );
  }
}
