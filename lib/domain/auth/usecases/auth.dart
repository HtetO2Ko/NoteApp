import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app/domain/auth/repository/auth.dart';

class AuthUseCase {
  Future<User?> login(String email, String password) async {
    return await AuthRepository().login(email, password);
  }

  Future<UserCredential?> registerUser(String email, String password) async {
    return await AuthRepository().registerUser(email, password);
  }
}
