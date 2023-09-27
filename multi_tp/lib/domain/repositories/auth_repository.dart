
import 'package:multi_tp/data/dtos/auth_user_dto.dart';

abstract interface class AuthRepository {
  AuthUser? get currentUser;

  Future<void> sendPasswordResetEmail({required String email});

  Future<AuthUser> logIn({required String email, required String password});

  Future<void> sendEmailVerification();

  Future<void> signOut();
}
