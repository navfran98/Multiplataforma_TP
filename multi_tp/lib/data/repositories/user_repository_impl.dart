

import 'package:multi_tp/data/datasources/user_dao.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.userDao});

  final UserDao userDao;
  
  @override
  Future<User> createUser({required String uid, required String email, required String name, required String lastName}) async {
    final newUser = await userDao.createUser(uid, email, name, lastName);
    return newUser;    
  }

}