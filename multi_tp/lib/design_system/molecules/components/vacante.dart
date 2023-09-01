import 'package:flutter/material.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens/shadows.dart';

class Vacante extends StatelessWidget {
  const Vacante({Key? key, required this.number}) : super(key: key);
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: number == 0 ?ColorPalette.neutral25 : ColorPalette.secondary25,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Vacantes:",
            style: CustomFont.body02(ColorPalette.neutral100),
          ),
          const SizedBox(width: 8,),
          Icon(
            Icons.person,
            color: number == 0 ? ColorPalette.secondary80 : ColorPalette.secondary200,
            size: 20,
          ),
          Text(number.toString(),
              style: CustomFont.subtitle01(number == 0 ? ColorPalette.secondary80 : ColorPalette.secondary200))
        ],
      ),
    );
  }
}
