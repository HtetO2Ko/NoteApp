import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/data/note/models/add_note.dart';
import 'package:note_app/data/note/models/edit_note.dart';
import 'package:note_app/data/note/source/note.dart';

class NoteRepository {
  Future<void> addNote(AddNoteModel addNoteModel) {
    return NoteDataSource().addNote(addNoteModel);
  }

  Future<void> editNote(EditNoteModel editNoteModel) {
    return NoteDataSource().editNote(editNoteModel);
  }

  Future<void> deleteNote(String noteID) {
    return NoteDataSource().deleteNote(noteID);
  }

  Stream<QuerySnapshot> getNotes(String userEmail) {
    return NoteDataSource().getNotes(userEmail);
  }
}
