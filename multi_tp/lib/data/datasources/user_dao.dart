

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';

abstract interface class UserDao {
 // Create user after signup
  Future<User> createUser({required String uid, required String email, required String name, required String lastName});

  // Manage favorites
  Future<void> addFavorite({required String volunteeringId});
  Future<void> deleteFavorite({required String volunteeringId});

  // Update user info
  Future<void> updateUser({required String userId, required User newUser});

  // Find user from ID
  Future<User?> findUserById({required String id});
}

class UserDaoImpl extends UserDao {
  final userCollection = 'users';

  // Constructor and Factory Constructor
  UserDaoImpl();
  factory UserDaoImpl.instance() => UserDaoImpl();

  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  
  @override
  Future<User> createUser({required String uid, required String email, required String name, required String lastName}) async {
    final docUser = _firestoreInstance.collection(userCollection).doc(uid);
    final User user = User(id: uid, email: email, name: name, lastName: lastName);
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
    if(snapshot.exists) {
      return User.fromJson(id, snapshot.data()!);
    } else {
      return null;
    }
  }
  
  @override
  Future<void> updateUser({required String userId, required User newUser}) async {
    final userRef = _firestoreInstance.collection(userCollection).doc(userId);
    await userRef.update(newUser.toJson());
  }
}