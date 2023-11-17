import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_tp/application/controllers/logged_user_controller.dart';
import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/presentation/design_system/cells/forms/contact_form.dart';
import 'package:multi_tp/presentation/design_system/cells/forms/personal_form.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/screens/profile_screen.dart';
import 'package:multi_tp/presentation/screens/single_volunteering_screen.dart';
import 'package:multi_tp/router.dart';

class EditProfileScreen extends StatefulHookConsumerWidget {
  static const route = "/home/profile/edit";
  static const routeName = "edit_profile";

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String? filePath;
  bool fromVolunteering = false;
  String? volId;

  void Function() _handleCancel(BuildContext context, WidgetRef ref) {
    return () {
      ref.read(mainBeamerDelegateProvider).beamToNamed(ProfileScreen.route);
    };
  }

  void _handleSaveChanges(User loggedUser, String date, String email,
      String phone, String gender) async {
    loggedUser.birthDate = date;
    loggedUser.genre = gender;
    loggedUser.phoneNumber = phone;
    loggedUser.contactEmail = email;
     ref
        .read(loggedUserControllerProvider.notifier)
        .updateUser(newUser: loggedUser, localImagePath: filePath);
    if(fromVolunteering) {
      ref.read(mainBeamerDelegateProvider).beamToNamed(SingleVolunteeringScreen.routeFromId(volId!), data: {"fromProfile": true});
    } else {
      ref.read(mainBeamerDelegateProvider).beamToNamed(ProfileScreen.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ref.watch(mainBeamerDelegateProvider).currentBeamLocation.data;

    if (arguments != null && arguments is Map<String, dynamic>) {
      fromVolunteering = arguments['fromVolunteering'];
      volId = arguments['volId'];
    }
    final loggedUserController = ref.watch(loggedUserControllerProvider);
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
            final dateController = useTextEditingController(
                text: user!.birthDate != null ? user.birthDate! : "");
            final phoneController = useTextEditingController(
                text: user.phoneNumber != null ? user.phoneNumber! : "");
            final contactEmailController = useTextEditingController(
                text: user.contactEmail != null ? user.contactEmail! : "");

            final genderController = useTextEditingController(
                text: user.genre != null ? user.genre! : "");

            final bool isDateEmpty = useListenableSelector(
                dateController, () => dateController.text.isEmpty);
            final bool isPhoneEmpty = useListenableSelector(
                phoneController, () => phoneController.text.isEmpty);
            final bool isEmailEmpty = useListenableSelector(
                contactEmailController,
                () => contactEmailController.text.isEmpty);

            final bool isGenderEmpty = useListenableSelector(
                genderController, () => genderController.text.isEmpty);

            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  color: ColorPalette.neutral0,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                  child: Column(
                    children: [
                      PersonalForm(
                          imageUrl: user.imageUrl,
                          dateController: dateController,
                          onGenderSelected: (value) {
                            setState(() {
                              genderController.text = value!;
                            });
                          },
                          onProfilePicSelected: (value) {
                            setState(() {
                              filePath = value;
                            });
                          },
                          initialValue: user.genre),
                      const SizedBox(
                        height: 32,
                      ),
                      ContactForm(
                        phoneController: phoneController,
                        emailController: contactEmailController,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      CtaButton(
                          isTransparent: false,
                          isDisabled: (isEmailEmpty ||
                              isPhoneEmpty ||
                              isDateEmpty ||
                              isGenderEmpty || (filePath == null && user.imageUrl == null)),
                          text: "Guardar cambios",
                          onPressedFunction: () {
                            if (_formKey.currentState!.validate()) {
                              _handleSaveChanges(
                                  user,
                                  dateController.text,
                                  contactEmailController.text,
                                  phoneController.text,
                                  genderController.text);
                            }
                          })
                    ],
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) => const Center(
            child: Text("Error"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
