import 'package:flutter/material.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/design_system/molecules/inputs/textfield.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void Function() _handleSignup(BuildContext context) {
    return () {
      context.go('/signup');
    };
  }

  void Function() _handleLogin(BuildContext context) {
    return () {
      context.go('/userwelcome');
    };
  }

  @override
  Widget build(BuildContext context) {
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
                onPressedFunction: _handleLogin(context)),
            const SizedBox(
              height: 16,
            ),
            CtaButton(
                isTransparent: true,
                isDisabled: false,
                text: "No tengo cuenta",
                onPressedFunction: _handleSignup(context)),
            const SizedBox(
              height: 32,
            )
          ]),
    ));
  }
}
