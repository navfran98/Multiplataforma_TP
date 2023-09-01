import 'package:flutter/material.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';

class NoVolunteering extends StatelessWidget {
  const NoVolunteering({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
      color: ColorPalette.neutral0,
      borderRadius: BorderRadius.circular(4),),
      child: const Text(
        "Actualmente no hay voluntariados vigentes. Pronto se irán ircorporando nuevos", 
        style: CustomFont.subtitle01(ColorPalette.neutral100),
        textAlign: TextAlign.center,)
    );
  }
}
