import 'package:multi_tp/data/datasources/user_dao.dart';
import 'package:multi_tp/data/repositories/auth_repository_impl.dart';
import 'package:multi_tp/data/repositories/user_repository_impl.dart';
import 'package:multi_tp/domain/repositories/auth_repository.dart';
import 'package:multi_tp/domain/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

///
/// Daos
///

@Riverpod(keepAlive: true)
UserDao userDao(UserDaoRef ref) => UserDaoImpl();

///
/// Repositories
///


@Riverpod(keepAlive: true)
AuthRepository authRepository(
  AuthRepositoryRef ref,
) =>
    AuthRepositoryImpl();

@Riverpod(keepAlive: true)
UserRepository userRepository(
  UserRepositoryRef ref,
) =>
    UserRepositoryImpl(
      userDao: ref.watch(userDaoProvider), 
      authRepository: ref.watch(authRepositoryProvider)
    );