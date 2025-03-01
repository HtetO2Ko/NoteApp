import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app/data/auth/models/auth.dart';

class AuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> login(AuthModel authModel) async {
    UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: authModel.email,
      password: authModel.password,
    );
    return userCredential.user;
  }

  Future<UserCredential?> registerUser(AuthModel authModel) async {
    UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: authModel.email,
      password: authModel.password,
    );
    return userCredential;
  }
}
