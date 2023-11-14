import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/data/dtos/news_dto.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/presentation/design_system/tokens/shadows.dart';
import 'package:multi_tp/presentation/screens/single_news_screen.dart';
import 'package:multi_tp/router.dart';

class NewsCard extends ConsumerWidget {
  const NewsCard({Key? key, required this.news}) : super(key: key);
  final News news;

  void Function() _handleNews(BuildContext context, WidgetRef ref) {
    return () {
      ref.read(mainBeamerDelegateProvider).beamToNamed(SingleNewsScreen.routeFromId(news.id));
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
              height: 156,
              child: Image.network(
                news.imageUrl,
                fit: BoxFit.cover,
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
                  Text(
                    news.reportNumber,
                    style: const CustomFont.overline(ColorPalette.neutral75),
                  ),
                  Text(
                    news.title,
                    style: const CustomFont.subtitle01(ColorPalette.neutral100),
                  ),
                  Text(
                    news.subtitle,
                    style: const CustomFont.body02(ColorPalette.neutral75),
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
