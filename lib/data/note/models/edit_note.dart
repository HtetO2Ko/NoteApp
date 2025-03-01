import 'package:cloud_firestore/cloud_firestore.dart';

class EditNoteModel {
  final String noteID;
  final String title;
  final String desc;
  final String userEmail;
  final Timestamp createdAt;
  EditNoteModel({
    required this.noteID,
    required this.title,
    required this.desc,
    required this.userEmail,
    required this.createdAt,
  });
}
