import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/presentation/screens/login_screen.dart';
import 'package:multi_tp/presentation/screens/signup_screen.dart';
import 'package:multi_tp/router.dart';

class WelcomeScreen extends ConsumerWidget {
  static const route = "/welcome";
  static const routeName = "welcome";

  const WelcomeScreen({Key? key}) : super(key: key);

  void Function() _handleLogin(BuildContext context, WidgetRef ref) {
    return () {
      ref.read(mainBeamerDelegateProvider).beamToNamed(LoginScreen.route);
    };
  }

  void Function() _handleSignup(BuildContext context, WidgetRef ref) {
    return () {
      ref.read(mainBeamerDelegateProvider).beamToNamed(SignupScreen.route);
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
            Image.asset('images/Welcome_logo.png', fit: BoxFit.fill, width: 150, height: 150,),
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
                onPressedFunction: _handleLogin(context, ref)),
            const SizedBox(
              height: 16,
            ),
            CtaButton(
                isTransparent: true,
                isDisabled: false,
                text: "Registrarse",
                onPressedFunction: _handleSignup(context, ref)),
            const SizedBox(
              height: 32,
            )
          ]),
    ));
  }
}
