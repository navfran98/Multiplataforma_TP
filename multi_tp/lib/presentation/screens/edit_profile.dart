import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_tp/application/controllers/get_logged_user_controller.dart';
import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/presentation/design_system/cells/forms/contact_form.dart';
import 'package:multi_tp/presentation/design_system/cells/forms/personal_form.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/screens/profile_screen.dart';
import 'package:multi_tp/router.dart';

class EditProfileScreen extends StatefulHookConsumerWidget {
  static const route = "/home/profile/edit";
  static const routeName = "edit_profile";

  const EditProfileScreen({Key? key}) : super(key: key);
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditProfileScreenState();

}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedGender;

  void Function() _handleCancel(BuildContext context, WidgetRef ref) {
    return () {
      ref.read(mainBeamerDelegateProvider).beamToNamed(ProfileScreen.route);
    };
  }

  void _handleSaveChanges(User loggedUser, String date, String email, String phone) async {
    loggedUser.birthDate = date;
    loggedUser.genre = _selectedGender;
    loggedUser.phoneNumber = phone;
    loggedUser.contactEmail = email;
    // TODO: cambiar esto por controller
    ref.read(userRepositoryProvider).updateUser(userId: loggedUser.id, newUser: loggedUser);
    ref.read(mainBeamerDelegateProvider).beamToNamed(ProfileScreen.route);
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
          final dateController = useTextEditingController(text: user!.birthDate != null ? user.birthDate! : "");
          final phoneController = useTextEditingController(text: user.phoneNumber != null ? user.phoneNumber! : "");
          final contactEmailController = useTextEditingController(text: user.contactEmail != null ? user.contactEmail! : "");
          final bool isDateEmpty = useListenableSelector(
            dateController, () => dateController.text.isEmpty);
          final bool isPhoneEmpty = useListenableSelector(
            phoneController, () => phoneController.text.isEmpty);
          final bool isEmailEmpty = useListenableSelector(
            contactEmailController, () => contactEmailController.text.isEmpty);
          _selectedGender = user.genre != null ? user.genre : null;
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
                    ContactForm(phoneController: phoneController, emailController: contactEmailController,),
                    const SizedBox(
                      height: 32,
                    ),
                    CtaButton(
                        isTransparent: false,
                        isDisabled: (isEmailEmpty || isPhoneEmpty || isDateEmpty || _selectedGender == null) ,
                        text: "Guardar cambios",
                        onPressedFunction: () {
                          if (_formKey.currentState!.validate()) {
                            _handleSaveChanges(user, dateController.text, contactEmailController.text, phoneController.text);
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
