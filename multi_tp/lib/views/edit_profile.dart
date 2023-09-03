import 'package:flutter/material.dart';
import 'package:multi_tp/design_system/cells/forms/contact_form.dart';
import 'package:multi_tp/design_system/cells/forms/personal_form.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/design_system/molecules/inputs/textfield.dart';
import 'package:go_router/go_router.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  void Function() _handleCancel(BuildContext context) {
    return () {
      context.go('/home');
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: _handleCancel(context),
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
