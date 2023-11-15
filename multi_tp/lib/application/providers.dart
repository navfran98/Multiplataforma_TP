import 'package:multi_tp/data/datasources/news_dao.dart';
import 'package:multi_tp/data/datasources/user_dao.dart';
import 'package:multi_tp/data/datasources/volunteering_dao.dart';
import 'package:multi_tp/data/repositories/auth_repository_impl.dart';
import 'package:multi_tp/data/repositories/news_repository_impl.dart';
import 'package:multi_tp/data/repositories/user_repository_impl.dart';
import 'package:multi_tp/data/repositories/volunteering_repository_impl.dart';
import 'package:multi_tp/domain/repositories/auth_repository.dart';
import 'package:multi_tp/domain/repositories/news_repository.dart';
import 'package:multi_tp/domain/repositories/user_repository.dart';
import 'package:multi_tp/domain/repositories/volunteering_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/providers.g.dart';

///
/// Daos
///

@Riverpod(keepAlive: true)
UserDao userDao(UserDaoRef ref) => UserDaoImpl();

@Riverpod(keepAlive: true)
NewsDao newsDao(NewsDaoRef ref) => NewsDaoImpl();

@Riverpod(keepAlive: true)
VolunteeringDao volunteeringDao(VolunteeringDaoRef ref) => VolunteeringDaoImpl();

///
/// Repositories
///

@Riverpod(keepAlive: true)
AuthRepository authRepository(
  AuthRepositoryRef ref,
) =>
    AuthRepositoryImpl();

@Riverpod(keepAlive: true)
NewsRepository newsRepository(
  NewsRepositoryRef ref,
) =>
    NewsRepositoryImpl(newsDao: ref.watch(newsDaoProvider));

@Riverpod(keepAlive: true)
VolunteeringRepository volunteeringRepository(
  VolunteeringRepositoryRef ref,
) =>
    VolunteeringRepositoryImpl(volunteeringDao: ref.watch(volunteeringDaoProvider));

@Riverpod(keepAlive: true)
UserRepository userRepository(
  UserRepositoryRef ref,
) =>
    UserRepositoryImpl(
        userDao: ref.watch(userDaoProvider),
        authRepository: ref.watch(authRepositoryProvider));
