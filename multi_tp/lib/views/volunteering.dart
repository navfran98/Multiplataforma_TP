import 'package:flutter/material.dart';
import 'package:multi_tp/design_system/molecules/components/vacante.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/molecules/buttons/cta_button.dart';
import 'package:go_router/go_router.dart';

class VolunteeringPage extends StatefulWidget {
  const VolunteeringPage({Key? key}) : super(key: key);

  @override
  State<VolunteeringPage> createState() => _VolunteeringPageState();
}

class _VolunteeringPageState extends State<VolunteeringPage> {
  int _freeSpaces = 0;
  bool _applied = false;
  bool _participating = false;
  bool _alreadyVolunteering = false;

  void Function() _handleBack(BuildContext context) {
    return () {
      context.go('/home');
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'images/vol.png', // Reemplaza con la URL de tu imagen
                width: double.infinity, // Para ocupar todo el ancho
                height: 240, // Altura fija de 240
                fit: BoxFit.cover, // Ajustar la imagen al tamaño del contenedor
              ),
              Positioned(
                top: 20, // Espacio superior
                left: 16, // Espacio izquierdo
                child: BackButton(
                  color: ColorPalette.neutral0,
                  onPressed: _handleBack(context),
                ),
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "ACCION SOCIAL",
                    style: CustomFont.overline(ColorPalette.neutral75),
                  ),
                  const Text(
                    "Un Techo para mi País",
                    style: CustomFont.headline01(ColorPalette.neutral100),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "El propósito principal de \"Un techo para mi país\" es reducir el déficit habitacional y mejorar las condiciones de vida de las personas que no tienen acceso a una vivienda adecuada.",
                    style: CustomFont.body01(ColorPalette.secondary200),
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Sobre la actividad",
                    style: CustomFont.headline02(ColorPalette.neutral100),
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Te necesitamos para construir las viviendas de las personas que necesitan un techo. Estas están prefabricadas en madera y deberás ayudar en carpintería, montaje, pintura y demás actividades de la construcción.",
                    style: CustomFont.body01(ColorPalette.neutral100),
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "ACA VA CARD MAPA",
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Participar del voluntariado",
                    style: CustomFont.headline02(ColorPalette.neutral100),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Requisitos",
                    style: CustomFont.subtitle01(ColorPalette.neutral100),
                  ),
                  const Text(
                    "\t\u2022\t Mayor de edad.\n\t\u2022\t Poder levantar cosas pesadas.",
                    style: CustomFont.body01(ColorPalette.neutral100),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Disponibilidad",
                    style: CustomFont.subtitle01(ColorPalette.neutral100),
                  ),
                  const Text(
                    "\t\u2022\t Mayor de edad.\n\t\u2022\t Poder levantar cosas pesadas.",
                    style: CustomFont.body01(ColorPalette.neutral100),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Vacante(number: _freeSpaces),
                  const SizedBox(
                    height: 24,
                  ),
                  renderButton()
                ],
              )),
        ],
      ),
    ));
  }

  Widget renderButton() {
    if (_alreadyVolunteering) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Ya estas participando en otro voluntariado, debes abandonarlo primero para postularte a este.",
              style: CustomFont.body01(ColorPalette.neutral100),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            CtaButton(
                isTransparent: true,
                isDisabled: false,
                text: "Abandonar voluntariado actual",
                onPressedFunction: () {}),
            SizedBox(
              height: 24,
            ),
            CtaButton(
                isTransparent: false,
                isDisabled: true,
                text: "Postularme",
                onPressedFunction: () {})
          ],
        ),
      );
    } else if (_freeSpaces == 0) {
      return Container(
          child: Column(
        children: [
          Text(
            "No hay vacantes disponibles para postularse",
            style: CustomFont.body01(ColorPalette.neutral100),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          SizedBox(
            height: 24,
          ),
          CtaButton(
              isTransparent: false,
              isDisabled: true,
              text: "Postularme",
              onPressedFunction: () {})
        ],
      ));
    } else if (_participating) {
      return Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Estas participando",
            style: CustomFont.headline02(ColorPalette.neutral100),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "La organización confirmó que ya estas participando de este voluntariado",
            style: CustomFont.body01(ColorPalette.neutral100),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          CtaButton(
              isTransparent: true,
              isDisabled: false,
              text: "Abandonar voluntariado",
              onPressedFunction: () {})
        ],
      ));
    } else if (_applied) {
      return Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Te has postulado",
            style: CustomFont.headline02(ColorPalette.neutral100),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Pronto la organización se pondrá en contacto contigo y te inscribirá como participante.",
            style: CustomFont.body01(ColorPalette.neutral100),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          CtaButton(
              isTransparent: true,
              isDisabled: false,
              text: "Retirar postulacion",
              onPressedFunction: () {})
        ],
      ));
    }
    return CtaButton(
        isTransparent: false,
        isDisabled: false,
        text: "Postularme",
        onPressedFunction: () {});
  }
}
