import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/utils/logger.dart';

abstract interface class UserDao {
  // Create user after signup
  Future<User> createUser(
      {required String uid,
      required String email,
      required String name,
      required String lastName});

  // Manage favorites
  Future<void> addFavorite({required String volunteeringId});
  Future<void> deleteFavorite({required String volunteeringId});

  // Update user info
  Future<void> updateUser({required String userId, required User newUser});

  // Find user from ID
  Future<User?> findUserById({required String id});

  Stream<User?> streamUser({required String userId});

  Future<void> uploadProfilePicture(
      {required String userId, required String filePath});

  Future<File?> getUserProfilePicture(String? imageUrl);

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
    final User user =
        User(id: uid, email: email, name: name, lastName: lastName);
    final json = user.toJson();

    await docUser.set(json);
    return user;
  }

  @override
  Future<void> addFavorite({required String volunteeringId}) async {
    // TODO: implement addFavorite
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFavorite({required String volunteeringId}) async {
    // TODO: implement deleteFavorite
    throw UnimplementedError();
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


   Future<File?> getUserProfilePicture(String? imageUrl) async {
    if (imageUrl == null || imageUrl.isEmpty) {
      // If the user does not have a profile picture, you can return null or a default image file
      return null;
    }

    try {
      // Get the reference from the image URL
      Reference imageReference = _storage.refFromURL(imageUrl);

      // Download the image to a temporary file
      File tempFile = File('tmp/temp_image.jpg');
      await imageReference.writeToFile(tempFile);

      return tempFile;
    } catch (e) {
      // Handle the exception here
      logger.e('Error getting user profile picture: $e');
      return null; // Return null in case of an error
    }
  }

  @override
  Future<void> uploadProfilePicture(
      {required String userId, required String filePath}) async {
    try {
      File file = File(filePath);

      User user = await findUserById(id: userId) as User;

      Reference storageReference =
          _storage.ref().child('profile_pictures/$userId.jpg');
      // Upload file to Firebase Storage
      await storageReference.putFile(file);
      // Get download URL
      String imageUrl = await storageReference.getDownloadURL();
      user.imageUrl = imageUrl;
      await updateUser(userId: userId, newUser: user);
    } catch (e) {
      // Handle the exception here
      logger.e('Error uploading profile picture: $e');
      rethrow;
    }
  }

}
