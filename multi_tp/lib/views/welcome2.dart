import 'package:flutter/material.dart';
import 'package:multi_tp/utils/colors.dart';
import 'package:multi_tp/utils/font.dart';
import 'package:multi_tp/buttons/cta_button.dart';

class Welcome2Page extends StatelessWidget {
  const Welcome2Page({Key? key}) : super(key: key);

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
            const SizedBox(height: 30,),
            const Text(
              "¡Bienvenido!",
              style: CustomFont.headline01(ColorPalette.neutral100),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48,),
            const Text(
              "Nunca subestimes tu habilidad para mejorar la vida de alguien.",
              style: CustomFont.subtitle01(Colors.black),
              textAlign: TextAlign.center,
            ),
            Expanded(child: Container()),
            const CtaButton(isTransparent: false, isDisabled: false, text: "Comenzar"),
            const SizedBox(height: 92,),
          ]
        ),
      )
    );
  }
}