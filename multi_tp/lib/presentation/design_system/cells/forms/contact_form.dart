import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/presentation/design_system/molecules/inputs/textfield.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/presentation/utils/validators.dart';

class ContactForm extends ConsumerStatefulWidget {
  const ContactForm({Key? key, required this.phoneController, required this.emailController}) : super(key: key);
  final TextEditingController phoneController;
  final TextEditingController emailController;
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactFormState();

}

class _ContactFormState extends ConsumerState<ContactForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Datos de contacto",
            style: CustomFont.headline01(ColorPalette.neutral100),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Estos datos serán compartidos con la organización para ponerse en contacto contigo",
            style: CustomFont.subtitle01(ColorPalette.neutral100),
            softWrap: true,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            isDisabled: false,
            floatingLabel: true,
            labelText: "Telefono",
            hintText: "Ej: +541178445459",
            controller: widget.phoneController,
            validator: Validators.validatePhoneNumber,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            isDisabled: false,
            floatingLabel: true,
            labelText: "Email",
            hintText: "Ej: mimail@mail.com",
            controller: widget.emailController,
            validator: Validators.validateContactEmail,
          ),
        ],
      ),
    );
  }
}
