import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/molecules/inputs/textfield.dart';
import 'package:multi_tp/presentation/screens/signup_screen.dart';
import 'package:multi_tp/router.dart';

class LoginScreen extends ConsumerWidget {
  static const route = "/login";
  static const routeName = "login";

  const LoginScreen({Key? key}) : super(key: key);

  void Function() _handleSignup(BuildContext context, WidgetRef ref) {
    return () {
      ref.read(mainBeamerDelegateProvider).beamToNamed(SignupScreen.route);
    };
  }

  void Function() _handleLogin(BuildContext context, WidgetRef ref) {
    return () {
      context.go('/userwelcome');
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Image.asset('images/Welcome_logo.png', fit: BoxFit.fill),
            const SizedBox(
              height: 32,
            ),
            const CustomTextField(
              isDisabled: false,
              isError: false,
              labelText: "Email",
              floatingLabel: false,
            ),
            const SizedBox(height: 24),
            const CustomTextField(
              isDisabled: false,
              isError: false,
              labelText: "Contraseña",
              floatingLabel: false,
              isObscure: true,
            ),
            Expanded(child: Container()),
            CtaButton(
                isTransparent: false,
                isDisabled: true,
                text: "Iniciar Sesion",
                onPressedFunction: _handleLogin(context, ref)),
            const SizedBox(
              height: 16,
            ),
            CtaButton(
                isTransparent: true,
                isDisabled: false,
                text: "No tengo cuenta",
                onPressedFunction: _handleSignup(context, ref)),
            const SizedBox(
              height: 32,
            )
          ]),
    ));
  }
}
