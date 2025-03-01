import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/data/note/models/add_note.dart';

class NoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addNote(AddNoteModel addNoteModel) async {
    try {
      await _firestore.collection("notes").add({
        "title": addNoteModel.title,
        "description": addNoteModel.desc,
        "userEmail": addNoteModel.userEmail,
        "createdAt": FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw "Error adding note: $e";
    }
  }

  Stream<QuerySnapshot> getNotes(String userEmail) {
    return _firestore
        .collection("notes")
        .where('userEmail', isEqualTo: 'hteto2ko.dev@gmail.com')
        .snapshots();
  }
}
