import 'package:flutter/material.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';

class NoVolunteering extends StatelessWidget {
  const NoVolunteering({Key? key, this.text}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        color: ColorPalette.neutral0,
        borderRadius: BorderRadius.circular(4),),
        child: Text(text != null ? text! : "Actualmente no hay voluntariados vigentes. Pronto se irán ircorporando nuevos",
          style: const CustomFont.subtitle01(ColorPalette.neutral100),
          textAlign: TextAlign.center,)
    );
  }
}
