import 'dart:io';

import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';

abstract interface class UserRepository {
  // Create user after signup
  Future<User> createUser(
      {required String uid,
      required String email,
      required String name,
      required String lastName});

  // Manage favorites
  Future<void> addFavorite(
      {required String userId, required String volunteeringId});
  Future<void> deleteFavorite(
      {required String userId, required String volunteeringId});

  // Update user info
  Future<void> updateUser(
      {required String userId, required User newUser, String? localImagePath});

  // Find user from ID
  Future<User?> findUserById({required String id});

  Stream<User?> streamLoggedUser();

  // FindLoggedUser
  Future<User?> findLoggedUser();

  Future<void> applyToVolunteering(
      {required String userId, required Volunteering volunteering});

  Future<void> leaveVolunteering({required String userId, required String volunteeringId});
  
}
