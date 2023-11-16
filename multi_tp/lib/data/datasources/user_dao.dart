import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
import 'package:multi_tp/utils/logger.dart';

abstract interface class UserDao {
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
  Future<void> updateUser({required String userId, required User newUser});

  // Find user from ID
  Future<User?> findUserById({required String id});

  Stream<User?> streamUser({required String userId});

  Future<String?> uploadProfilePicture(
      {required String userId, required String filePath});

  Future<void> applyToVolunteering(
      {required String userId, required Volunteering volunteering});

  Future<void> leaveVolunteering({
    required String userId,
    required String volunteeringId,
  });
}

class UserDaoImpl extends UserDao {
  final userCollection = 'users';

  // Constructor and Factory Constructor
  UserDaoImpl();
  factory UserDaoImpl.instance() => UserDaoImpl();

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

  @override
  Future<User> createUser(
      {required String uid,
      required String email,
      required String name,
      required String lastName}) async {
    final docUser = _firestoreInstance.collection(userCollection).doc(uid);
    final User user = User(
        id: uid,
        email: email,
        name: name,
        lastName: lastName,
        favorites: [],
        profileCompleted: false);
    final json = user.toJson();

    await docUser.set(json);
    return user;
  }

  @override
  Future<void> addFavorite(
      {required String userId, required String volunteeringId}) async {
    final Map<Object, Object> params = {
      'favorites': FieldValue.arrayUnion([volunteeringId])
    };
    await _firestoreInstance
        .collection(userCollection)
        .doc(userId)
        .update(params);
  }

  @override
  Future<void> deleteFavorite(
      {required String userId, required String volunteeringId}) async {
    final Map<Object, Object> params = {
      'favorites': FieldValue.arrayRemove([volunteeringId])
    };
    await _firestoreInstance
        .collection(userCollection)
        .doc(userId)
        .update(params);
  }

  @override
  Future<User?> findUserById({required String id}) async {
    final docUser = _firestoreInstance.collection(userCollection).doc(id);
    final snapshot = await docUser.get();
    if (snapshot.exists) {
      return User.fromJson(id, snapshot.data()!);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateUser(
      {required String userId, required User newUser}) async {
    newUser.profileCompleted = true;
    final userRef = _firestoreInstance.collection(userCollection).doc(userId);
    await userRef.update(newUser.toJson());
  }

  @override
  Stream<User?> streamUser({required String userId}) {
    final docUser = _firestoreInstance.collection(userCollection).doc(userId);

    return docUser.snapshots().map((snapshot) {
      if (snapshot.exists) {
        return User.fromJson(userId, snapshot.data()!);
      } else {
        return null;
      }
    });
  }

  @override
  Future<String?> uploadProfilePicture(
      {required String userId, required String filePath}) async {
    try {
      Reference storageReference =
          _storage.ref().child('profile_pictures/$userId.jpg');
      // Upload file to Firebase Storage
      await storageReference.putFile(File(filePath));
      // Get download URL
      return await storageReference.getDownloadURL();
    } catch (e) {
      // Handle the exception here
      logger.e('Error uploading profile picture: $e');
      rethrow;
    }
  }

  @override
  Future<void> applyToVolunteering(
      {required String userId, required Volunteering volunteering}) async {
    final ret = {
      'activeVolunteering': {
        'id': volunteering.id,
        'type': volunteering.type,
        'title': volunteering.title,
        'location': volunteering.location
      }
    };
    await _firestoreInstance.collection(userCollection).doc(userId).update(ret);
  }
  
  @override
  Future<void> leaveVolunteering({required String userId, required String volunteeringId}) async {
    final ret = {
      'activeVolunteering': FieldValue.delete()
    };
    await _firestoreInstance.collection(userCollection).doc(userId).update(ret);
  }


}
