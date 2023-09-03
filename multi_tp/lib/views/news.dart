import 'package:flutter/material.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/molecules/buttons/cta_button.dart';
import 'package:go_router/go_router.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.secondary90,
          centerTitle: true,
          leading: const BackButton(
            color: ColorPalette.neutral0,
          ),
          title: const Text("Novedades",
              style: CustomFont.subtitle01(ColorPalette.neutral0)),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "reporte 2820",
                    style: CustomFont.overline(ColorPalette.neutral75),
                  ),
                  const Text(
                    "Ser donante voluntario ",
                    style: CustomFont.headline02(ColorPalette.neutral100),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: SizedBox(
                        width: double.infinity,
                        height: 160,
                        child: Image.asset(
                          'images/news_card.png',
                          fit: BoxFit.fitWidth,
                        ),
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
                    style: CustomFont.subtitle01(ColorPalette.secondary200),
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "En un esfuerzo por concienciar sobre la necesidad constante de sangre y sus componentes, el Hospital Centenario destaca la importancia de convertirse en un donante voluntario. La donación de sangre es un acto solidario y altruista que puede salvar vidas y mejorar la salud de aquellos que enfrentan enfermedades graves o accidentes. La donación voluntaria de sangre desempeña un papel vital en el sistema de salud. A diferencia de la donación de sangre por reposición, donde se solicita a familiares y amigos donar para un paciente específico, la donación voluntaria se realiza sin ninguna conexión directa con un receptor particular. Esto garantiza un suministro constante y seguro de sangre y productos sanguíneos para todos aquellos que lo necesiten. Los beneficios de ser donante voluntario son numerosos. Además de la satisfacción de ayudar a quienes más lo necesitan, la donación de sangre tiene beneficios para la salud del propio donante. Al donar sangre, se realiza un chequeo médico que incluye pruebas para detectar enfermedades transmisibles, lo que puede proporcionar una evaluación temprana y ayuda en el diagnóstico de posibles problemas de salud.",
                    style: CustomFont.body01(ColorPalette.neutral100),
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Center(
                    child: Text(
                      "Comparte esta nota",
                      style: CustomFont.headline02(ColorPalette.neutral100),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CtaButton(
                      isTransparent: false,
                      isDisabled: false,
                      text: "Compartir",
                      onPressedFunction: () {})
                ],
              )),
        ));
  }
}
