import 'package:flutter/material.dart';
import 'package:multi_tp/utils/font.dart';
import 'package:multi_tp/buttons/cta_button.dart';
import 'package:multi_tp/inputs/textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            const CustomTextField(
              isDisabled: false, 
              isError: false,
              labelText: "Label 1",
              floatingLabel: false,
            ),
            const SizedBox(height: 24),
            const CustomTextField(
              isDisabled: false, 
              isError: true,
              labelText: "Label 2",
              hintText: "Placeholder",
              floatingLabel: true,
            ),  
            Expanded(child: Container()),          
            const CtaButton(isTransparent: false, isDisabled: true, text: "Iniciar Sesion"),
            const SizedBox(height: 16,),
            const CtaButton(isTransparent: true, isDisabled: false, text: "No tengo cuenta"),
            const  SizedBox(height: 32,)
          ]
        ),
      )
    );
  }
}