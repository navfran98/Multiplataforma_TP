import 'package:flutter/material.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens/shadows.dart';

class CurrentVolCard extends StatelessWidget {
  const CurrentVolCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: ColorPalette.primary5,
          boxShadow: const [
            CustomShadow.shadow02_1(),
            CustomShadow.shadow02_2()
          ],
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 2, color: ColorPalette.primary100)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ACCION SOCIAL",
                style: CustomFont.overline(ColorPalette.neutral75),
              ),
              Text(
                "Un Techo para mi Pais",
                style: CustomFont.subtitle01(ColorPalette.neutral100),
              )
            ],
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.location_pin,
            color: ColorPalette.primary100,
          )
        ],
      ),
    );
  }
}
