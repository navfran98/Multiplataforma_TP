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

  Future<void> updateUser(
      {required User newUser, String? localImagePath}) async {
    await ref.read(userRepositoryProvider).updateUser(
        newUser: newUser, userId: newUser.id, localImagePath: localImagePath);
  }

  Future<void> addFavorite(
      {required String userId, required String volunteeringId}) async {
    await ref
        .read(userRepositoryProvider)
        .addFavorite(userId: userId, volunteeringId: volunteeringId);
  }

  Future<void> deleteFavorite(
      {required String userId, required String volunteeringId}) async {
    await ref
        .read(userRepositoryProvider)
        .deleteFavorite(userId: userId, volunteeringId: volunteeringId);
  }
}
