import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app/data/auth/source/auth.dart';

class AuthRepository {
  Future<User?> login(String email, String password) {
    return AuthDataSource().login(email, password);
  }

  Future<UserCredential?> registerUser(String email, String password) {
    return AuthDataSource().registerUser(email, password);
  }
}
