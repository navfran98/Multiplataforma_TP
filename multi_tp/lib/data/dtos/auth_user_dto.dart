import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  //Variables
  //final bool emailVerified;
  final String? email;
  final String id;

  // Constructor
  const AuthUser({required this.id, /*required this.emailVerified,*/ required this.email});

  // Constructor using factory pattern
  factory AuthUser.fromFirebase(User user) =>
      AuthUser(id:user.uid,  /*emailVerified: user.emailVerified,*/ email: user.email);
}
