import 'package:flutter/material.dart';
import 'package:multi_tp/utils/font.dart';
import 'package:multi_tp/buttons/cta_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
            const SizedBox(height: 32,),
            const Text(
              "\"El esfuerzo desinteresado para llevar alegría a los demás será el comienzo de una vida más feliz para nosotros\"",
              style: CustomFont.subtitle01(Colors.black),
              textAlign: TextAlign.center,
            ),
            Expanded(child: Container()),
            const CtaButton(isTransparent: false, isDisabled: false, text: "Iniciar Sesion"),
            const SizedBox(height: 16,),
            const CtaButton(isTransparent: true, isDisabled: false, text: "Registrarse"),
            const SizedBox(height: 32,)
          ]
        ),
      )
    );
  }
}