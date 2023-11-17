import 'package:flutter/material.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.title, required this.firstLabel, required this.firstContent, required this.secondLabel, required this.secondContent}) : super(key: key);
  final String title;
  final String firstLabel;
  final String firstContent;
  final String secondLabel;
  final String secondContent;

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
        crossAxisAlignment: CrossAxisAlignment
            .start, // Asegura que ambos hijos tengan la misma altura
        children: [
          Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              color: ColorPalette.secondary25,
              child: Text(
                title,
                style: const CustomFont.subtitle01(ColorPalette.neutral100),
              )),
          Container(
            width: double.infinity,
            color: ColorPalette.neutral10,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    firstLabel,
                    style: const CustomFont.overline(ColorPalette.neutral75),
                  ),
                  Text(
                    firstContent,
                    style: const CustomFont.body01(ColorPalette.neutral100),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    secondLabel,
                    style: const CustomFont.overline(ColorPalette.neutral75),
                  ),
                  Text(
                    secondContent,
                    style: const CustomFont.body01(ColorPalette.neutral100),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
