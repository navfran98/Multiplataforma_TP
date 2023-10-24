

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
  
  @override
  Future<void> addFavorite({required String volunteeringId}) {
    // TODO: implement addFavorite
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteFavorite({required String volunteeringId}) {
    // TODO: implement deleteFavorite
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateUser({required String userId, required User newUser}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
  
  @override
  Future<User?> findLoggedUser() {
    // TODO: implement findLoggedUser
    throw UnimplementedError();
  }
  
  @override
  Future<User?> findUserById({required String id}) {
    // TODO: implement findUserById
    throw UnimplementedError();
  }

}