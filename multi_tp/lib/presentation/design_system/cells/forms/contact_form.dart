import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multi_tp/presentation/design_system/molecules/inputs/textfield.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();
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
            controller: controller,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            isDisabled: false,
            floatingLabel: true,
            labelText: "Email",
            hintText: "Ej: mimail@mail.com",
            controller: controller2,
          ),
        ],
      ),
    );
  }
}
