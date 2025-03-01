import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/navigation/app_navigation.dart';
import 'package:note_app/core/utils/displaymessage.dart';
import 'package:note_app/core/utils/validator.dart';
import 'package:note_app/data/note/models/add_note.dart';
import 'package:note_app/domain/note/usecases/note.dart';

class AddNoteNotifier extends ChangeNotifier {
  final TextEditingController _titleCtr = TextEditingController();
  final TextEditingController _descCtr = TextEditingController();
  TextEditingController get titleCtr => _titleCtr;
  TextEditingController get descCtr => _descCtr;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final user = FirebaseAuth.instance.currentUser;

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

    AddNoteModel addNoteModel = AddNoteModel(
      title: _titleCtr.text,
      desc: _descCtr.text,
      userEmail: user!.email!,
    );

    try {
      await NoteUseCase().addNote(addNoteModel);
      DisplayMessage.showSnackBar("Note added successfully!", true);
      AppNavigator.pop(context, value: true);
    } catch (e) {
      DisplayMessage.showSnackBar("Error: $e", false);
    }

    _isLoading = false;
    notifyListeners();
  }
}
