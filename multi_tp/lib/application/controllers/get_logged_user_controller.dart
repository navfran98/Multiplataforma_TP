import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../generated/get_logged_user_controller.g.dart';

@riverpod 
Future<User?> getLoggedUserController(GetLoggedUserControllerRef ref) async {
  return await ref.read(userRepositoryProvider).findLoggedUser();
}