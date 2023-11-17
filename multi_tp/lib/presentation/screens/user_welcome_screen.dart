import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/presentation/screens/volunteering_screen.dart';
import 'package:multi_tp/router.dart';

class UserWelcomeScreen extends ConsumerWidget {
  static const route = "/user_welcome";
  static const routeName = "user_welcome";

  const UserWelcomeScreen({Key? key}) : super(key: key);

  void Function() _handleGoHome(BuildContext context, WidgetRef ref) {
    return () {
      ref
          .read(mainBeamerDelegateProvider)
          .beamToNamed(VolunteeringScreen.route);
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
              height: 30,
            ),
            const Text(
              "¡Bienvenido!",
              style: CustomFont.headline01(ColorPalette.neutral100),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 48,
            ),
            const Text(
              "Nunca subestimes tu habilidad para mejorar la vida de alguien.",
              style: CustomFont.subtitle01(Colors.black),
              textAlign: TextAlign.center,
            ),
            Expanded(child: Container()),
            CtaButton(
                isTransparent: false,
                isDisabled: false,
                text: "Comenzar",
                onPressedFunction: _handleGoHome(context, ref)),
            const SizedBox(
              height: 92,
            ),
          ]),
    ));
  }
}
