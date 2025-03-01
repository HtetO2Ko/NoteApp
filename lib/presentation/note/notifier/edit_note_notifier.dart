import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/navigation/app_navigation.dart';
import 'package:note_app/core/utils/displaymessage.dart';
import 'package:note_app/core/utils/validator.dart';
import 'package:note_app/data/note/models/edit_note.dart';
import 'package:note_app/data/note/models/note.dart';
import 'package:note_app/domain/note/usecases/note.dart';

class EditNoteNotifier extends ChangeNotifier {
  final TextEditingController _titleCtr = TextEditingController();
  final TextEditingController _descCtr = TextEditingController();
  TextEditingController get titleCtr => _titleCtr;
  TextEditingController get descCtr => _descCtr;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isDeleteLoading = false;
  bool get isDeleteLoading => _isDeleteLoading;
  final user = FirebaseAuth.instance.currentUser;
  Note? _editNote;

  void bindEditNote(Note editNote) {
    _editNote = editNote;
    _titleCtr.text = editNote.title;
    _descCtr.text = editNote.description;
    notifyListeners();
  }

  Future<void> deleteNote(BuildContext context) async {
    _isDeleteLoading = true;
    notifyListeners();

    try {
      await NoteUseCase().deleteNote(_editNote!.id);
      DisplayMessage.showSnackBar("Note deleted successfully!", true);
      AppNavigator.pop(context, value: true);
    } catch (e) {
      DisplayMessage.showSnackBar("Error: $e", false);
    }

    _isDeleteLoading = false;
    notifyListeners();
  }

  Future<void> saveNote(BuildContext context) async {
    String? titleError = Validator.validateTitle(_titleCtr.text);
    String? descError = Validator.validateDesc(_descCtr.text);

    if (titleError != null) {
      DisplayMessage.showSnackBar(titleError, false);
      notifyListeners();
      return;
    }
    if (descError != null) {
      DisplayMessage.showSnackBar(descError, false);
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    EditNoteModel editNoteModel = EditNoteModel(
      noteID: _editNote!.id,
      title: _titleCtr.text,
      desc: _descCtr.text,
      userEmail: user!.email!,
      createdAt: _editNote!.createdAt,
    );

    try {
      await NoteUseCase().editNote(editNoteModel);
      DisplayMessage.showSnackBar("Note edited successfully!", true);
      AppNavigator.pop(context, value: true);
    } catch (e) {
      DisplayMessage.showSnackBar("Error: $e", false);
    }

    _isLoading = false;
    notifyListeners();
  }
}
