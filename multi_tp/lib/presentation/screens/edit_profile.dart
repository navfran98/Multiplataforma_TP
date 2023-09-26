import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_tp/presentation/design_system/cells/forms/contact_form.dart';
import 'package:multi_tp/presentation/design_system/cells/forms/personal_form.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/screens/profile_screen.dart';
import 'package:multi_tp/router.dart';

class EditProfileScreen extends ConsumerWidget {
  static const route = "/home/profile/edit";
  static const routeName = "edit_profile";

  const EditProfileScreen({Key? key}) : super(key: key);

  void Function() _handleCancel(BuildContext context, WidgetRef ref) {
    return () {
      ref.read(mainBeamerDelegateProvider).beamToNamed(ProfileScreen.route);
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: SingleChildScrollView(
        child: Container(
          color: ColorPalette.neutral0,
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            children: [
              PersonalForm(),
              SizedBox(
                height: 32,
              ),
              ContactForm(),
              SizedBox(
                height: 32,
              ),
              CtaButton(
                  isTransparent: false,
                  isDisabled: false,
                  text: "Guardar cambios",
                  onPressedFunction: () {})
            ],
          ),
        ),
      ),
    );
  }
}
