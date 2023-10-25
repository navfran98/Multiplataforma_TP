

import 'package:multi_tp/data/datasources/user_dao.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/domain/repositories/auth_repository.dart';
import 'package:multi_tp/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.userDao, required this.authRepository});

  final UserDao userDao;
  final AuthRepository authRepository;
  
  @override
  Future<User> createUser({required String uid, required String email, required String name, required String lastName}) async {
    final newUser = await userDao.createUser(uid: uid, email: email, name: name, lastName: lastName);
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
  Future<User?> findLoggedUser() async {
    final loggedUser = authRepository.currentUser;
    if(loggedUser == null) {
      return null;
    } else {
      return await findUserById(id: loggedUser.id);
    }
  }
  
  @override
  Future<User?> findUserById({required String id}) async {
    return await userDao.findUserById(id: id);
  }

}