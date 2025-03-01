import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/domain/note/usecases/note.dart';

class NoteNotifier extends ChangeNotifier {
  final user = FirebaseAuth.instance.currentUser;
  Stream<QuerySnapshot> getNotes() {
    return NoteUseCase().getNotes(user!.email!);
  }
}
