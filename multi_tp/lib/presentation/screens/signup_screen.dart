import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/molecules/inputs/textfield.dart';
import 'package:multi_tp/presentation/screens/home_screen.dart';
import 'package:multi_tp/presentation/screens/login_screen.dart';
import 'package:multi_tp/presentation/screens/volunteering_screen.dart';
import 'package:multi_tp/router.dart';

class SignupScreen extends ConsumerStatefulWidget {
  static const route = "/signup";
  static const routeName = "signup";

  const SignupScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SignupScreenState();
}

class SignupScreenState extends ConsumerState<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  void Function() _handleLogin(BuildContext context, WidgetRef ref) {
    return () {
      ref.read(mainBeamerDelegateProvider).beamToNamed(LoginScreen.route);
    };
  }

  void Function() _handleHomeButton(BuildContext context, WidgetRef ref) {
    return () {
      ref.read(mainBeamerDelegateProvider).beamToNamed(VolunteeringScreen.route);
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
              CustomTextField(
                isDisabled: false,
                labelText: "Nombre",
                hintText: "Ej: Juan",
                floatingLabel: true,
                controller: nameController,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                isDisabled: false,
                labelText: "Apellido",
                hintText: "Ej: Barcena",
                floatingLabel: true,
                controller: lastNameController,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                isDisabled: false,
                labelText: "Email",
                hintText: "Ej: juanbarcena@mail.com",
                floatingLabel: true,
                controller: emailController,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                isDisabled: false,
                labelText: "Contraseña",
                hintText: "Ej: ABCD1234",
                floatingLabel: true,
                isObscure: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 150,
              ),
              CtaButton(
                  isTransparent: false,
                  isDisabled: false,
                  text: "Registrarse",
                  onPressedFunction: _handleHomeButton(context, ref)),
              const SizedBox(
                height: 16,
              ),
              CtaButton(
                  isTransparent: true,
                  isDisabled: false,
                  text: "Ya tengo cuenta",
                  onPressedFunction: _handleLogin(context, ref)),
              const SizedBox(
                height: 32,
              )
            ]),
      ),
    ));
  }
}
