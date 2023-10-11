import 'package:multi_tp/data/dtos/auth_user_dto.dart';

abstract interface class AuthRepository {
  AuthUser? get currentUser;

  // Future<void> sendPasswordResetEmail({required String email});

  // Future<void> signOut();

  Future<AuthUser> logIn({required String email, required String password});

  Future<void> signUp({required String email, required String password});

  Future<void> signOut();

}
