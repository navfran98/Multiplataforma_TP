import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../generated/logged_user_controller.g.dart';

@riverpod
class LoggedUserController extends _$LoggedUserController {
  late Stream<User?> userStream;

  @override
  Stream<User?> build() async* {
    userStream = ref.read(userRepositoryProvider).streamLoggedUser();
    yield* userStream;
  }

  Future<void> updateUser({required User newUser}) async {
    await ref
        .read(userRepositoryProvider)
        .updateUser(newUser: newUser, userId: newUser.id);
  }
}

// Future<User?> getLoggedUserController(LoggedUserControllerRef ref) async {
//   return await ref.read(userRepositoryProvider).findLoggedUser();
// }
