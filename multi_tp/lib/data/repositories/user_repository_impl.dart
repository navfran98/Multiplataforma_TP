import 'package:multi_tp/data/datasources/user_dao.dart';
import 'package:multi_tp/data/datasources/volunteering_dao.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
import 'package:multi_tp/domain/repositories/auth_repository.dart';
import 'package:multi_tp/domain/repositories/user_repository.dart';
import 'package:multi_tp/utils/logger.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(
      {required this.volunteeringDao,
      required this.userDao,
      required this.authRepository});

  final UserDao userDao;
  final VolunteeringDao volunteeringDao;
  final AuthRepository authRepository;

  @override
  Future<User> createUser(
      {required String uid,
      required String email,
      required String name,
      required String lastName}) async {
    final newUser = await userDao.createUser(
        uid: uid, email: email, name: name, lastName: lastName);
    return newUser;
  }

  @override
  Future<void> addFavorite(
      {required String userId, required String volunteeringId}) async {
    return userDao.addFavorite(userId: userId, volunteeringId: volunteeringId);
  }

  @override
  Future<void> deleteFavorite(
      {required String userId, required String volunteeringId}) {
    return userDao.deleteFavorite(
        userId: userId, volunteeringId: volunteeringId);
  }

  @override
  Future<void> updateUser(
      {required String userId,
      required User newUser,
      String? localImagePath}) async {
    if (localImagePath != null) {
      newUser.imageUrl = await userDao.uploadProfilePicture(
          userId: userId, filePath: localImagePath);
    }
    return userDao.updateUser(userId: userId, newUser: newUser);
  }

  @override
  Future<User?> findLoggedUser() async {
    final loggedUser = authRepository.currentUser;
    if (loggedUser == null) {
      return null;
    } else {
      return await findUserById(id: loggedUser.id);
    }
  }

  @override
  Future<User?> findUserById({required String id}) async {
    return await userDao.findUserById(id: id);
  }

  @override
  Stream<User?> streamLoggedUser() {
    final loggedUser = authRepository.currentUser;
    if (loggedUser == null) {
      throw Exception();
    } else {
      return userDao.streamUser(userId: loggedUser.id);
    }
  }

  @override
  Future<void> applyToVolunteering(
      {required String userId, required Volunteering volunteering}) async {
    await volunteeringDao.addPending(
        volunteeringId: volunteering.id, userId: userId);
    await userDao.applyToVolunteering(
        userId: userId, volunteering: volunteering);
  }

  @override
  Future<void> leaveVolunteering(
      {required String userId, required String volunteeringId}) async {
    
    await userDao.leaveVolunteering(
        userId: userId, volunteeringId: volunteeringId);

   
    await volunteeringDao.deleteAccepted(
          volunteeringId: volunteeringId, userId: userId);
   
    await volunteeringDao.deletePending(
          volunteeringId: volunteeringId, userId: userId);
    
  }
}
