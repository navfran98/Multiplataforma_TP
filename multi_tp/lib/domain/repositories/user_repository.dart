import 'package:multi_tp/data/dtos/user_dto.dart';

abstract interface class UserRepository {
  // Create user after signup
  Future<User> createUser({required String uid, required String email, required String name, required String lastName});

  // Manage favorites
  Future<void> addFavorite({required String volunteeringId});
  Future<void> deleteFavorite({required String volunteeringId});

  // Update user info
  Future<void> updateUser({required String userId, required User newUser});

  // Find user from ID
  Future<User?> findUserById({required String id});

  // Find logged user
  Future<User?> findLoggedUser();
}