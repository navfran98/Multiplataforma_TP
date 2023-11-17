import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/application/controllers/logged_user_controller.dart';
import 'package:multi_tp/application/controllers/single_volunteering_controller.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
import 'package:multi_tp/presentation/design_system/cells/cards/address_card.dart';
import 'package:multi_tp/presentation/design_system/cells/custom_modal.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/molecules/components/vacante.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/presentation/screens/edit_profile.dart';
import 'package:multi_tp/presentation/screens/volunteering_screen.dart';
import 'package:multi_tp/router.dart';
import 'package:multi_tp/utils/logger.dart';

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
    bool fromProfile = false;
    bool modalOpened = false;

  void Function() _handleBack(BuildContext context, WidgetRef ref) {
    return () {
      ref
          .read(mainBeamerDelegateProvider)
          .beamToNamed(VolunteeringScreen.route);
    };
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
      ref.watch(mainBeamerDelegateProvider).currentBeamLocation.data;

    if (arguments != null && arguments is Map<String, dynamic>) {
      fromProfile = arguments['fromProfile'];
    }
    final volunteering =
        ref.watch(singleVolunteeringControllerProvider(widget.id));
    final loggedUser = ref.watch(loggedUserControllerProvider);
    return Scaffold(
        body: loggedUser.when(
      data: (loggedUser) {
        return volunteering.when(
          data: (vol) {
            Future.delayed(Duration.zero, () {
              if(fromProfile && !modalOpened) {
                _handleModal(context, "Te estas por postular a", vol!.title, () { ref
                          .read(loggedUserControllerProvider.notifier)
                          .applyToVolunteering(userId: loggedUser!.id, volunteering: vol);
                        Navigator.pop(context);});
                setState(() {
                  modalOpened = true;
                });
                 ref.read(mainBeamerDelegateProvider).currentBeamLocation.data={};
                  
              }
            });
            final disponibility = vol!.disponibility.split("\\n");
            final requirement = vol.requirements.split("\\n");
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        vol.imageUrl, // Reemplaza con la URL de tu imagen
                        width: double.infinity, // Para ocupar el ancho
                        height: 240, // Altura fija de 240
                        fit: BoxFit
                            .cover,
                            
                        errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'images/offline_post.jpeg', 
                              fit: BoxFit.cover,
                            );
                            },
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
                          AddressCard(address: vol.address),
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
            child: CircularProgressIndicator(color: ColorPalette.primary100),
          ),
        );
      },
      error: (error, stackTrace) => const Center(
        child: Text("Error"),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(color: ColorPalette.primary100),
      ),
    ));
  }

  void _handleModal(BuildContext context, String title, String? subtitle, void Function() onPressed) async {
    // ignore: use_build_context_synchronously
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => Center(
              child: CustomModal(
              title: title,
              subtitle: subtitle,
              onPressedFunction: onPressed
            )));
  }

  Widget renderButton(Volunteering vol, User loggedUser) {
    if (vol.vacancies == 0) {
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
    } else if (loggedUser.activeVolunteering != null &&
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
                onPressedFunction: () => _handleModal(context, "¿Estás seguro que querés abandonar tu voluntariado actual?", loggedUser.activeVolunteering!['title'], () {ref
                    .read(loggedUserControllerProvider.notifier)
                    .leaveVolunteering(
                        userId: loggedUser.id,
                        volunteeringId: loggedUser.activeVolunteering!['id']);
                        Navigator.pop(context);})),
            const SizedBox(
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
    } else if (loggedUser.activeVolunteering != null && vol.accepted.contains(loggedUser.id)) {
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
              onPressedFunction: () => _handleModal(context, "¿Estás seguro que querés abandonar tu voluntariado?", vol.title, () { ref
                    .read(loggedUserControllerProvider.notifier)
                    .leaveVolunteering(
                        userId: loggedUser.id, volunteeringId: vol.id);
                    Navigator.pop(context);  }))
        ],
      ));
    } else if (loggedUser.activeVolunteering != null && vol.pending.contains(loggedUser.id)) {
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
              onPressedFunction: () => _handleModal(context, "¿Estás seguro que querés retirar tu postulación?", vol.title, () {ref
                    .read(loggedUserControllerProvider.notifier)
                    .leaveVolunteering(
                        userId: loggedUser.id, volunteeringId: vol.id);
                    Navigator.pop(context); }))
        ],
      ));
    }
    return CtaButton(
        isTransparent: false,
        isDisabled: false,
        text: "Postularme",
        onPressedFunction: () { 
          if(loggedUser.profileCompleted) {
             _handleModal(context, "Te estas por postular a", vol.title, () { ref
                .read(loggedUserControllerProvider.notifier)
                .applyToVolunteering(userId: loggedUser.id, volunteering: vol);
              Navigator.pop(context);});
          } else {
             _handleModal(context, "Para postularte debes primero completar tus datos.", null, () { ref.read(mainBeamerDelegateProvider).beamToNamed(EditProfileScreen.route, data: {'fromVolunteering': true, 'volId':vol.id} );
              Navigator.pop(context);});
            
          }
         
  });
  }
}
