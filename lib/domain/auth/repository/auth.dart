import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app/data/auth/models/auth.dart';
import 'package:note_app/data/auth/source/auth.dart';

class AuthRepository {
  Future<User?> login(AuthModel authModel) {
    return AuthDataSource().login(authModel);
  }

  Future<UserCredential?> registerUser(AuthModel authModel) {
    return AuthDataSource().registerUser(authModel);
  }
}
