


import 'package:flutter/material.dart';
import 'package:multi_tp/application/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../generated/signup_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {

  @override
  Future<void> build() async {}

  Future<String> signUp(
      BuildContext context, String email, String password) async {
    return await ref
        .read(authRepositoryProvider)
        .signUp(email: email, password: password);
  }
}