import 'package:flutter/material.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens/shadows.dart';
import 'package:multi_tp/design_system/molecules/components/vacante.dart';

class VolunteeringCard extends StatelessWidget {
  const VolunteeringCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.neutral0,
        boxShadow: const [CustomShadow.shadow02_1(), CustomShadow.shadow02_2()],
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
            ),
            child: SizedBox(
              height: 138,
              width: double.infinity,
              child: Image.asset(
                'images/Landscape-Color.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ACCION SOCIAL",
                      style: CustomFont.overline(ColorPalette.neutral75),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "Un Techo para mi Pais",
                      style: CustomFont.subtitle01(ColorPalette.neutral100),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Vacante(number: 10),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 24,
                      color: ColorPalette.primary100,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.location_pin,
                      size: 24,
                      color: ColorPalette.primary100,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
