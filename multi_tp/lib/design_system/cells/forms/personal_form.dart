import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multi_tp/design_system/cells/cards/info_card.dart';
import 'package:multi_tp/design_system/cells/cards/input_card.dart';
import 'package:multi_tp/design_system/cells/cards/profile_pic_card.dart';
import 'package:multi_tp/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/design_system/molecules/inputs/textfield.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens/shadows.dart';
import 'package:multi_tp/design_system/molecules/components/vacante.dart';

class PersonalForm extends StatelessWidget {
  const PersonalForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPalette.neutral0,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Datos de perfil", style: CustomFont.headline01(ColorPalette.neutral100),),
          const SizedBox(height: 24,),
          const CustomTextField(isDisabled: false, isError: false, floatingLabel: true, labelText: "Fecha de nacimiento"),
          const SizedBox(height: 24,),
          const InputCard(),
          const SizedBox(height: 24,),
          ProfilePicCard()
        ],
      ),
    );
  }
}
