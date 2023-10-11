import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException, User;
import 'package:multi_tp/domain/exceptions/invalid_credentials.dart';

import '../../domain/exceptions/email_already_in_use_auth_exception.dart';
import '../../domain/exceptions/generic_auth_exception.dart';
import '../../domain/exceptions/invalid_email_auth_exception.dart';
import '../../domain/exceptions/user_not_found_auth_exception.dart';
import '../../domain/exceptions/user_not_logged_in_auth_exception.dart';
import '../../domain/exceptions/weak_password_auth_exception.dart';
import '../../domain/exceptions/wrong_password_auth_exception.dart';

import '../../domain/repositories/auth_repository.dart';
import '../dtos/auth_user_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  // Constructor
  AuthRepositoryImpl();
  // Factory constructor
  factory AuthRepositoryImpl.instance() => AuthRepositoryImpl();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  AuthUser? get currentUser {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  Future<AuthUser> logIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        // Caso improbable...
        throw UserNotLoggedInAuthException("user not logged in");
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        throw UserNotFoundAuthException("user not found");
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordAuthException("wrong password");
      } else if (e.code == 'invalid-credential') {
        throw InvalidCredentialsException("invalid credentials");
      } else {
        throw GenericAuthException("generic error");
      }
    } catch (_) {
      throw GenericAuthException("generic error");
    }
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordAuthException("weak password");
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseAuthException("email already in use");
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailAuthException("invalid email");
      } else {
        throw GenericAuthException("generic error");
      }
    } catch (_) {
      throw GenericAuthException("generic error");
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // @override
  // Future<void> sendEmailVerification() async {
  //   final user = _firebaseAuth.currentUser;
  //   if (user != null) {
  //     await user.sendEmailVerification();
  //   }
  // }
}
