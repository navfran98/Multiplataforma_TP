import 'package:flutter/material.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/presentation/design_system/tokens/shadows.dart';

class CustomModal extends StatelessWidget {
  const CustomModal({Key? key, required this.title, this.subtitle, required this.onPressedFunction}) : super(key: key);
  final String title;
  final String? subtitle;
  final void Function() onPressedFunction;

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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const CustomFont.subtitle01(ColorPalette.neutral100),
          ),
          if(subtitle != null) 
            const Text(
              "Un Techo para mi País",
              style: CustomFont.headline02(ColorPalette.neutral100),
            ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 80, child: CtaButton(isTransparent: true, isDisabled: false, text: "Cancelar", onPressedFunction: (){Navigator.pop(context);})),
              const SizedBox(width: 8,),
              SizedBox(width: 80, child: CtaButton(isTransparent: true, isDisabled: false, text: "Confirmar", onPressedFunction: onPressedFunction,))
            ],
          )
        ],
      )
    );
  }
}
