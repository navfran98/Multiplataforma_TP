import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_tp/application/controllers/signup_controller.dart';
import 'package:multi_tp/data/datasources/user_dao.dart';
import 'package:multi_tp/data/datasources/volunteering_dao.dart';
import 'package:multi_tp/data/repositories/auth_repository_impl.dart';
import 'package:multi_tp/data/repositories/user_repository_impl.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/molecules/inputs/textfield.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/screens/login_screen.dart';
import 'package:multi_tp/presentation/screens/user_welcome_screen.dart';
import 'package:multi_tp/presentation/utils/new_snackbar.dart';
import 'package:multi_tp/router.dart';

class SignupScreen extends StatefulHookConsumerWidget {
  static const route = "/signup";
  static const routeName = "signup";

  const SignupScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SignupScreenState();
}

class SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void Function() _handleLogin(BuildContext context, WidgetRef ref) {
    return () {
      ref.read(mainBeamerDelegateProvider).beamToNamed(LoginScreen.route);
    };
  }

  void _handleSignUp(String email, String password, String name, String lastName) async {
    setState(() {
      isLoading = true;
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    try {
      final uid = await ref
          .read(signUpControllerProvider.notifier)
          .signUp(context, email, password);
      final userRepositoryImpl = UserRepositoryImpl(userDao: UserDaoImpl(), authRepository: AuthRepositoryImpl(), volunteeringDao: VolunteeringDaoImpl());
      userRepositoryImpl.createUser(uid: uid, email: email, name: name, lastName: lastName);
      ref
          .read(mainBeamerDelegateProvider)
          .beamToNamed(UserWelcomeScreen.route);
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
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final bool isNameEmpty = useListenableSelector(
        nameController, () => nameController.text.isEmpty);
    final bool isLastNameEmpty = useListenableSelector(
        lastNameController, () => lastNameController.text.isEmpty);
    final bool isEmailEmpty = useListenableSelector(
        emailController, () => emailController.text.isEmpty);
    final bool isPassEmpty = useListenableSelector(
        passwordController, () => passwordController.text.isEmpty);
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset('images/Welcome_logo.png', fit: BoxFit.fill, width: 150, height: 150,),
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
                isLoading
                  ? const CircularProgressIndicator(color: ColorPalette.primary100,)
                  : CtaButton(
                    isTransparent: false,
                    isDisabled: (isNameEmpty ||
                        isLastNameEmpty ||
                        isEmailEmpty ||
                        isPassEmpty),
                    text: "Registrarse",
                    onPressedFunction: () {
                      if (_formKey.currentState!.validate()) {
                        _handleSignUp(
                            emailController.text, passwordController.text, nameController.text, lastNameController.text);
                      }
                    }),
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
      ),
    ));
  }
}
