

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';

abstract interface class UserDao {
  
  Future<User> createUser(String uid, String email, String name, String lastName);
}

class UserDaoImpl extends UserDao {

  // Constructor and Factory Constructor
  UserDaoImpl();
  factory UserDaoImpl.instance() => UserDaoImpl();

  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  
  @override
  Future<User> createUser(String uid, String email, String name, String lastName) async {
    final docUser = _firestoreInstance.collection('users').doc(uid);
    final User user = User(email: email, name: name, lastName: lastName);
    final json = user.toJson();

    await docUser.set(json);
    return user;
  }
}