import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widget/custom_app_bar.dart';
import 'package:notes_app/views/widget/custom_text_field.dart';

class EditeNoteBody extends StatefulWidget {
  const EditeNoteBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditeNoteBody> createState() => _EditeNoteBodyState();
}

class _EditeNoteBodyState extends State<EditeNoteBody> {
  String? title;
  String? subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: "Edite Note",
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = subtitle ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            // value: widget.note.title,
            hint: widget.note.title,
            onChanged: (data) => title = data,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            // value: widget.note.subtitle,
            hint: widget.note.subtitle,
            maxLines: 5,
            onChanged: (data) => subtitle = data,
          )
        ],
      ),
    );
  }
}
