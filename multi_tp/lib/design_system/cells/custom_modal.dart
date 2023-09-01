import 'package:flutter/material.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens/shadows.dart';
import 'package:multi_tp/design_system/molecules/buttons/cta_button.dart';

class CustomModal extends StatelessWidget {
  const CustomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: BoxDecoration(
        color: ColorPalette.neutral0,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [CustomShadow.shadow03_1(), CustomShadow.shadow03_2()]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Te estas por postular a",
            style: CustomFont.subtitle01(ColorPalette.neutral100),
          ),
          const Text(
            "Un Techo para mi País",
            style: CustomFont.headline02(ColorPalette.neutral100),
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 80, child: CtaButton(isTransparent: true, isDisabled: false, text: "Cancelar", onPressedFunction: (){})),
              const SizedBox(width: 8,),
              SizedBox(width: 80, child: CtaButton(isTransparent: true, isDisabled: false, text: "Confirmar", onPressedFunction: (){}))
            ],
          )
        ],
      )
    );
  }
}
