import 'package:flutter/material.dart';
import 'package:multi_tp/utils/font.dart';
import 'package:multi_tp/buttons/cta_button.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  void Function() _handleLogin(BuildContext context) {
    return () {
      context.go('/login');
    };
  }

  void Function() _handleSignup(BuildContext context) {
    return () {
      context.go('/signup');
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
            const Text(
              "\"El esfuerzo desinteresado para llevar alegría a los demás será el comienzo de una vida más feliz para nosotros\"",
              style: CustomFont.subtitle01(Colors.black),
              textAlign: TextAlign.center,
            ),
            Expanded(child: Container()),
            CtaButton(
                isTransparent: false,
                isDisabled: false,
                text: "Iniciar Sesion",
                onPressedFunction: _handleLogin(context)),
            const SizedBox(
              height: 16,
            ),
            CtaButton(
                isTransparent: true,
                isDisabled: false,
                text: "Registrarse",
                onPressedFunction: _handleSignup(context)),
            const SizedBox(
              height: 32,
            )
          ]),
    ));
  }
}
