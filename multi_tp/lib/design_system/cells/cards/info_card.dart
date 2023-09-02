import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multi_tp/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens/shadows.dart';
import 'package:multi_tp/design_system/molecules/components/vacante.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: tengo un problema con la altura de la card que se ve afectada por la imagen
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPalette.neutral0,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start, // Asegura que ambos hijos tengan la misma altura
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            color: ColorPalette.secondary25,
            child: const Text(
              "Titulo",
              style: CustomFont.subtitle01(ColorPalette.neutral100),
            )
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Label", style: CustomFont.overline(ColorPalette.neutral75),),
                Text("Content", style: CustomFont.body01(ColorPalette.neutral100),),
                SizedBox(height: 8,),
                Text("Label", style: CustomFont.overline(ColorPalette.neutral75),),
                Text("Content", style: CustomFont.body01(ColorPalette.neutral100),),
              ]),
          )
        ],
      ),
    );
  }
}
