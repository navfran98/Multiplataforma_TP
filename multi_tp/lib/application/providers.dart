import 'package:multi_tp/data/repositories/auth_repository_impl.dart';
import 'package:multi_tp/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/providers.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(
  AuthRepositoryRef ref,
) =>
    AuthRepositoryImpl();