import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_tp/application/controllers/login_controller.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/molecules/inputs/textfield.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/screens/signup_screen.dart';
import 'package:multi_tp/presentation/screens/user_welcome_screen.dart';
import 'package:multi_tp/presentation/utils/new_snackbar.dart';
import 'package:multi_tp/presentation/utils/validators.dart';
import 'package:multi_tp/router.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  static const route = "/login";
  static const routeName = "login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void Function() _handleSignup(BuildContext context, WidgetRef ref) {
    return () {
      ref.read(mainBeamerDelegateProvider).beamToNamed(SignupScreen.route);
    };
  }

  void _handleLogin(String email, String password) async {
    setState(() {
      isLoading = true;
    });
    try {
      await ref
          .read(loginControllerProvider.notifier)
          .logIn(context, email, password);
      ref.read(mainBeamerDelegateProvider).beamToNamed(UserWelcomeScreen.route);
    } on Exception catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: NewSnackbar(text: e.toString()),
          behavior: SnackBarBehavior.fixed,
          backgroundColor: ColorPalette.error100,
          elevation: 0,
        ));
      });
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passController = useTextEditingController();
    final bool isEmailEmpty = useListenableSelector(
        emailController, () => emailController.text.isEmpty);
    final bool isPassEmpty = useListenableSelector(
        passController, () => passController.text.isEmpty);
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
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
              CustomTextField(
                isDisabled: false,
                labelText: "Email",
                floatingLabel: false,
                controller: emailController,
                validator: Validators.validateEmail,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                isDisabled: false,
                labelText: "Contraseña",
                floatingLabel: false,
                isObscure: true,
                controller: passController,
                validator: Validators.validatePassword,
              ),
              Expanded(child: Container()),
              isLoading
                  ? const CircularProgressIndicator(
                      color: ColorPalette.primary100,
                    )
                  : CtaButton(
                      isTransparent: false,
                      isDisabled: (isEmailEmpty || isPassEmpty),
                      text: "Iniciar Sesion",
                      onPressedFunction: () {
                        if (_formKey.currentState!.validate()) {
                          _handleLogin(
                              emailController.text, passController.text);
                        }
                      }),
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
      ),
    ));
  }
}
