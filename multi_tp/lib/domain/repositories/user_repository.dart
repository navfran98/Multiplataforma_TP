import 'package:multi_tp/data/dtos/user_dto.dart';

abstract interface class UserRepository {
  Future<User> createUser({required String uid, required String email, required String name, required String lastName});
}