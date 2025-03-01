import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/navigation/app_navigation.dart';
import 'package:note_app/core/utils/displaymessage.dart';
import 'package:note_app/core/utils/validator.dart';
import 'package:note_app/domain/auth/usecases/auth.dart';
import 'package:note_app/presentation/note/note.dart';

class RegisterNotifier extends ChangeNotifier {
  final TextEditingController _emailCtr = TextEditingController();
  final TextEditingController _pswCtr = TextEditingController();
  bool _isVisibility = true;
  bool _isLoading = false;

  TextEditingController get emailCtr => _emailCtr;
  TextEditingController get pswCtr => _pswCtr;
  bool get isVisibility => _isVisibility;
  bool get isLoading => _isLoading;

  void changeVisibility() {
    _isVisibility = !_isVisibility;
    notifyListeners();
  }

  void registerClick(BuildContext context) async {
    String trimmedEmail = _emailCtr.text.trim();
    String trimmedPassword = _pswCtr.text.trim();

    String? emailError = Validator.validateEmail(trimmedEmail);
    String? passwordError = Validator.validatePassword(trimmedPassword);

    if (emailError != null) {
      DisplayMessage.showSnackBar(emailError, false);
      notifyListeners();
      return;
    }

    if (passwordError != null) {
      DisplayMessage.showSnackBar(passwordError, false);
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      final UserCredential? user =
          await AuthUseCase().registerUser(trimmedEmail, trimmedPassword);
      if (user == null) {
        DisplayMessage.showSnackBar(
          "Register failed. Please check your credentials.",
          false,
        );
      } else {
        print(user);
        AppNavigator.pushAndRemove(context, NotePage());
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'invalid-email':
            DisplayMessage.showSnackBar(
              "The email address is not valid.",
              false,
            );
            break;
          case 'invalid-credential':
            DisplayMessage.showSnackBar(
              "Incorrect Email or Password. Please try again.",
              false,
            );
            break;
          case 'email-already-in-use':
            DisplayMessage.showSnackBar(
              "This email is already registered. Please try again.",
              false,
            );
            break;
          default:
            DisplayMessage.showSnackBar(
              "An error occurred. Please try again.",
              false,
            );
        }
      } else {
        DisplayMessage.showSnackBar(
          "An unexpected error occurred: $e",
          false,
        );
      }
    }
    _isLoading = false;
    notifyListeners();
  }
}
