import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multi_tp/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens/shadows.dart';
import 'package:multi_tp/design_system/molecules/components/vacante.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: tengo un problema con la altura de la card que se ve afectada por la imagen
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPalette.neutral0,
        boxShadow: const [CustomShadow.shadow02_1(), CustomShadow.shadow02_2()],
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment
            .start, // Asegura que ambos hijos tengan la misma altura
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              bottomLeft: Radius.circular(2),
            ),
            child: SizedBox(
              width: 118.0,
              child: Image.asset(
                'images/news_card.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "reporte 2820",
                    style: CustomFont.overline(ColorPalette.neutral75),
                  ),
                  const Text(
                    "Ser donante voluntario ",
                    style: CustomFont.subtitle01(ColorPalette.neutral100),
                  ),
                  const Text(
                    "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
                    style: CustomFont.body02(ColorPalette.neutral75),
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: 75,
                          child: CtaButton(
                              isTransparent: true,
                              isDisabled: false,
                              text: "Leer Mas",
                              onPressedFunction: () {}))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
