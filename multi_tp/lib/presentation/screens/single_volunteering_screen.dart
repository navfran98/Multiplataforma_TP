import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/application/controllers/logged_user_controller.dart';
import 'package:multi_tp/application/controllers/single_volunteering_controller.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/molecules/components/vacante.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/presentation/screens/volunteering_screen.dart';
import 'package:multi_tp/router.dart';

class SingleVolunteeringScreen extends ConsumerStatefulWidget {
  static const route = "/home/volunteering/:id";
  static const routeName = "single_volunteering";

  static String routeFromId(String id) => '/home/volunteering/$id';

  const SingleVolunteeringScreen({Key? key, required this.id})
      : super(key: key);
  final String id;

  @override
  ConsumerState<SingleVolunteeringScreen> createState() =>
      _SingleVolunteeringScreenState();
}

class _SingleVolunteeringScreenState
    extends ConsumerState<SingleVolunteeringScreen> {
  void Function() _handleBack(BuildContext context, WidgetRef ref) {
    return () {
      ref
          .read(mainBeamerDelegateProvider)
          .beamToNamed(VolunteeringScreen.route);
    };
  }

  @override
  Widget build(BuildContext context) {
    final volunteering =
        ref.watch(singleVolunteeringControllerProvider(widget.id));
    final loggedUser = ref.watch(loggedUserControllerProvider);
    return Scaffold(
      body: loggedUser.when(
      data: (loggedUser) {
        return volunteering.when(
          data: (vol) {
            final disponibility = vol!.disponibility.split("\\n");
            final requirement = vol.requirements.split("\\n");
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        vol.imageUrl, // Reemplaza con la URL de tu imagen
                        width: double.infinity, // Para ocupar todo el ancho
                        height: 240, // Altura fija de 240
                        fit: BoxFit
                            .cover, // Ajustar la imagen al tamaño del contenedor
                      ),
                      Positioned(
                        top: 20, // Espacio superior
                        left: 16, // Espacio izquierdo
                        child: BackButton(
                          color: ColorPalette.neutral0,
                          onPressed: _handleBack(context, ref),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vol.type,
                            style: const CustomFont.overline(
                                ColorPalette.neutral75),
                          ),
                          Text(
                            vol.title,
                            style: const CustomFont.headline01(
                                ColorPalette.neutral100),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            vol.purpose,
                            style: const CustomFont.body01(
                                ColorPalette.secondary200),
                            softWrap: true,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Sobre la actividad",
                            style:
                                CustomFont.headline02(ColorPalette.neutral100),
                            softWrap: true,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            vol.detail,
                            style: const CustomFont.body01(
                                ColorPalette.neutral100),
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
                            style:
                                CustomFont.headline02(ColorPalette.neutral100),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Requisitos",
                            style:
                                CustomFont.subtitle01(ColorPalette.neutral100),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Markdown(
                            data: requirement[0],
                            shrinkWrap: true,
                            softLineBreak: true,
                            padding: const EdgeInsets.all(0),
                          ),
                          Markdown(
                            data: requirement[1],
                            shrinkWrap: true,
                            softLineBreak: true,
                            padding: const EdgeInsets.all(0),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Disponibilidad",
                            style:
                                CustomFont.subtitle01(ColorPalette.neutral100),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Markdown(
                            data: disponibility[0],
                            shrinkWrap: true,
                            softLineBreak: true,
                            padding: const EdgeInsets.all(0),
                          ),
                          Markdown(
                            data: disponibility[1],
                            shrinkWrap: true,
                            softLineBreak: true,
                            padding: const EdgeInsets.all(0),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Vacante(number: vol.vacancies),
                          const SizedBox(
                            height: 24,
                          ),
                          renderButton(vol, loggedUser!)
                        ],
                      )),
                ],
              ),
            );
          },
          error: (error, stackTrace) => const Center(
            child: Text("Error"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      error: (error, stackTrace) => const Center(
        child: Text("Error"),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }

  Widget renderButton(Volunteering vol, User loggedUser) {
    if (loggedUser.activeVolunteering != null &&
        loggedUser.activeVolunteering!['id'] != vol.id) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Ya estas participando en otro voluntariado, debes abandonarlo primero para postularte a este.",
              style: CustomFont.body01(ColorPalette.neutral100),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            CtaButton(
                isTransparent: true,
                isDisabled: false,
                text: "Abandonar voluntariado actual",
                onPressedFunction: () {}),
            const SizedBox(
              height: 24,
            ),
            CtaButton(
                isTransparent: false,
                isDisabled: true,
                text: "Postularme",
                onPressedFunction: () {
                  final actualVolunteering = ref.read(
                      singleVolunteeringControllerProvider(
                          loggedUser.activeVolunteering!['id']));
                  return actualVolunteering.when(
                      data: (actualVol) => ref
                          .read(loggedUserControllerProvider.notifier)
                          .leaveVolunteering(
                              userId: loggedUser.id, volunteering: actualVol!),
                      error: (error, stackTrace) => const Center(
                            child: Text("Error"),
                          ),
                      loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ));
                })
          ],
        ),
      );
    } else if (vol.vacancies == 0) {
      return Container(
          child: Column(
        children: [
          const Text(
            "No hay vacantes disponibles para postularse",
            style: CustomFont.body01(ColorPalette.neutral100),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          const SizedBox(
            height: 24,
          ),
          CtaButton(
              isTransparent: false,
              isDisabled: true,
              text: "Postularme",
              onPressedFunction: () {})
        ],
      ));
    } else if (vol.accepted.contains(loggedUser.id)) {
      return Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Estas participando",
            style: CustomFont.headline02(ColorPalette.neutral100),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "La organización confirmó que ya estas participando de este voluntariado",
            style: CustomFont.body01(ColorPalette.neutral100),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          CtaButton(
              isTransparent: true,
              isDisabled: false,
              text: "Abandonar voluntariado",
              onPressedFunction: () {
                ref
                    .read(loggedUserControllerProvider.notifier)
                    .leaveVolunteering(
                        userId: loggedUser.id, volunteering: vol);
              })
        ],
      ));
    } else if (vol.pending.contains(loggedUser.id)) {
      return Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Te has postulado",
            style: CustomFont.headline02(ColorPalette.neutral100),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Pronto la organización se pondrá en contacto contigo y te inscribirá como participante.",
            style: CustomFont.body01(ColorPalette.neutral100),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          CtaButton(
              isTransparent: true,
              isDisabled: false,
              text: "Retirar postulacion",
              onPressedFunction: () {
                ref
                    .read(loggedUserControllerProvider.notifier)
                    .leaveVolunteering(
                        userId: loggedUser.id, volunteering: vol);
              })
        ],
      ));
    }
    return CtaButton(
        isTransparent: false,
        isDisabled: false,
        text: "Postularme",
        onPressedFunction: () {
          ref
              .read(loggedUserControllerProvider.notifier)
              .applyToVolunteering(userId: loggedUser.id, volunteering: vol);
        });
  }
}
