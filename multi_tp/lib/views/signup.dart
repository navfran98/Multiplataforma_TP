import 'package:flutter/material.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/design_system/molecules/inputs/textfield.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  void Function() _handleLogin(BuildContext context) {
    return () {
      context.go('/login');
    };
  }

  void Function() _handleHomeButton(BuildContext context) {
    return () {
      context.go('/userwelcome');
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset('images/Welcome_logo.png', fit: BoxFit.fill),
              const SizedBox(
                height: 31,
              ),
              const CustomTextField(
                isDisabled: false,
                isError: false,
                labelText: "Nombre",
                hintText: "Ej: Juan",
                floatingLabel: true,
              ),
              const SizedBox(height: 24),
              const CustomTextField(
                isDisabled: false,
                isError: false,
                labelText: "Apellido",
                hintText: "Ej: Barcena",
                floatingLabel: true,
              ),
              const SizedBox(height: 24),
              const CustomTextField(
                isDisabled: false,
                isError: false,
                labelText: "Email",
                hintText: "Ej: juanbarcena@mail.com",
                floatingLabel: true,
              ),
              const SizedBox(height: 24),
              const CustomTextField(
                isDisabled: false,
                isError: false,
                labelText: "Contraseña",
                hintText: "Ej: ABCD1234",
                floatingLabel: true,
                isObscure: true,
              ),
              const SizedBox(
                height: 150,
              ),
              CtaButton(
                  isTransparent: false,
                  isDisabled: false,
                  text: "Registrarse",
                  onPressedFunction: _handleHomeButton(context)),
              const SizedBox(
                height: 16,
              ),
              CtaButton(
                  isTransparent: true,
                  isDisabled: false,
                  text: "Ya tengo cuenta",
                  onPressedFunction: _handleLogin(context)),
              const SizedBox(
                height: 32,
              )
            ]),
      ),
    ));
  }
}
