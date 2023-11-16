import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
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

  Future<void> applyToVolunteering(
      {required String userId, required Volunteering volunteering}) async {
    await ref
        .read(userRepositoryProvider)
        .applyToVolunteering(userId: userId, volunteering: volunteering);
  }

  Future<void> leaveVolunteering(
      {required String userId, required Volunteering volunteering}) async {
    await ref
        .read(userRepositoryProvider)
        .leaveVolunteering(userId: userId, volunteering: volunteering);
  }
}
