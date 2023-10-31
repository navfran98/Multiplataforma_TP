import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_tp/application/controllers/get_logged_user_controller.dart';
import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/datasources/user_dao.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/data/repositories/auth_repository_impl.dart';
import 'package:multi_tp/data/repositories/user_repository_impl.dart';
import 'package:multi_tp/presentation/design_system/cells/forms/contact_form.dart';
import 'package:multi_tp/presentation/design_system/cells/forms/personal_form.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/screens/profile_screen.dart';
import 'package:multi_tp/router.dart';
import 'package:multi_tp/utils/logger.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  static const route = "/home/profile/edit";
  static const routeName = "edit_profile";

  const EditProfileScreen({Key? key}) : super(key: key);
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditProfileScreenState();

}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedGender;
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void Function() _handleCancel(BuildContext context, WidgetRef ref) {
    return () {
      ref.read(mainBeamerDelegateProvider).beamToNamed(ProfileScreen.route);
    };
  }

  void _handleSaveChanges(User loggedUser) async {
    if(dateController.text.isNotEmpty){
      loggedUser.birthDate = dateController.text;
    }
    if(_selectedGender != null){
      loggedUser.genre = _selectedGender;
    }
    if(phoneController.text.isNotEmpty){
      loggedUser.phoneNumber = phoneController.text;
    }
    //TODO: Esto no se si cambia solo el email de la coleccion user o tmb el de auth
    // if(emailController.text.isNotEmpty){
    // }
    // TODO: cambiar esto por controller
    ref.read(userRepositoryProvider).updateUser(userId: loggedUser.id, newUser: loggedUser);
    ref.read(mainBeamerDelegateProvider).beamToNamed(ProfileScreen.route);
  }

  setInitialvalues(User user) {
    dateController.text = user.birthDate != null ? user.birthDate! : "";
    phoneController.text = user.phoneNumber != null ? user.phoneNumber! : "";
    // emailController.text = user.birthDate != null ? user.birthDate! : "";
  }

  @override
  Widget build(BuildContext context) {
    final loggedUserController = ref.watch(getLoggedUserControllerProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.neutral0,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: _handleCancel(context, ref),
          child: const Icon(
            Icons.close,
            color: ColorPalette.neutral75,
          ),
        ),
        centerTitle: false,
      ),
      body: loggedUserController.when(
        data: (user) {
          setInitialvalues(user!);
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                color: ColorPalette.neutral0,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                child: Column(
                  children: [
                    PersonalForm(dateController: dateController, onGenderSelected: (value) => {_selectedGender = value}, initialValue: user.genre),
                    const SizedBox(
                      height: 32,
                    ),
                    ContactForm(phoneController: phoneController, emailController: emailController,),
                    const SizedBox(
                      height: 32,
                    ),
                    CtaButton(
                        isTransparent: false,
                        isDisabled: false,
                        text: "Guardar cambios",
                        onPressedFunction: () {
                          if (_formKey.currentState!.validate()) {
                            _handleSaveChanges(user!);
                          }
                        })
                  ],
                ),
              ),
            ),
          );
        },
        error: (error, stackTrace) => const Center(child: Text("Error"),),
        loading: () => const Center(child: CircularProgressIndicator(),), 
      )
    );
  }
}
