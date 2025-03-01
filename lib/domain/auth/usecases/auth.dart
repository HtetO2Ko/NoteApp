import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app/data/auth/models/auth.dart';
import 'package:note_app/domain/auth/repository/auth.dart';

class AuthUseCase {
  Future<User?> login(AuthModel authModel) async {
    return await AuthRepository().login(authModel);
  }

  Future<UserCredential?> registerUser(AuthModel authModel) async {
    return await AuthRepository().registerUser(authModel);
  }
}
