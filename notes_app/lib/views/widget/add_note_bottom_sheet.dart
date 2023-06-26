import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/widget/custom_text_field.dart';

import 'custom_bottom.dart';

class AddNotesBottomSheet extends StatelessWidget {
  const AddNotesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            CustomTextField(
              hint: "Title",
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextField(
              hint: "content",
              maxLines: 5,
            ),
            SizedBox(
              height: 32,
            ),
            CustomBottom(),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
