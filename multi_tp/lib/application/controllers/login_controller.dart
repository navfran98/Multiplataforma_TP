
import 'package:flutter/material.dart';
import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/dtos/auth_user_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../generated/login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {

  @override
  Future<void> build() async {}

  Future<AuthUser> logIn(
      BuildContext context, String email, String password) async {
    return await ref
        .read(authRepositoryProvider)
        .logIn(email: email, password: password);
  }
}