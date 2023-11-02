import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/presentation/design_system/tokens/shadows.dart';
import 'package:multi_tp/presentation/screens/single_news_screen.dart';
import 'package:multi_tp/router.dart';

class NewsCard extends ConsumerWidget {
  const NewsCard({Key? key, required this.id}) : super(key: key);
  final String id;

  void Function() _handleNews(BuildContext context, WidgetRef ref) {
    return () {
      ref.read(mainBeamerDelegateProvider).beamToNamed(SingleNewsScreen.routeFromId(id));
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                              onPressedFunction: _handleNews(context, ref)))
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