import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/data/note/models/add_note.dart';
import 'package:note_app/data/note/models/edit_note.dart';
import 'package:note_app/domain/note/repository/note.dart';

class NoteUseCase {
  Future<void> addNote(AddNoteModel addNoteModel) {
    return NoteRepository().addNote(addNoteModel);
  }

  Future<void> editNote(EditNoteModel editNoteModel) {
    return NoteRepository().editNote(editNoteModel);
  }

  Future<void> deleteNote(String noteID) {
    return NoteRepository().deleteNote(noteID);
  }

  Stream<QuerySnapshot> getNotes(String userEmail) {
    return NoteRepository().getNotes(userEmail);
  }
}
