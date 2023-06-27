import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  void add(NoteModel note) async{
    emit(AddNotesLoading());
    try {
      var noteBox =  Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNotesSuccess());
    } catch (e) {
        emit(AddNotesFailure(errMessage: e.toString()));
    }
  }
}
