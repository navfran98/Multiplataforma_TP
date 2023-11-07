

import 'dart:io';

import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_profile_pic_controller.g.dart';


@riverpod
Future<File?> getProfilePicController(
  GetProfilePicControllerRef ref,  {required User user} ) async {
  return await ref.read(userRepositoryProvider).getUserProfilePicture(user);
}
