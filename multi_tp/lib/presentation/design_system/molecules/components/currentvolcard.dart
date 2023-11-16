import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/application/controllers/open_google_maps_controller.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/presentation/design_system/tokens/shadows.dart';
import 'package:multi_tp/presentation/screens/single_volunteering_screen.dart';
import 'package:multi_tp/router.dart';

class CurrentVolCard extends ConsumerWidget {
  const CurrentVolCard({Key? key, required this.loggedUser}) : super(key: key);
  final User loggedUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(mainBeamerDelegateProvider).beamToNamed(
            SingleVolunteeringScreen.routeFromId(
                loggedUser.activeVolunteering!['id']));
      },
      child: Container(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  loggedUser.activeVolunteering!['type'],
                  style: const CustomFont.overline(ColorPalette.neutral75),
                ),
                Text(
                  loggedUser.activeVolunteering!['title'],
                  style: const CustomFont.subtitle01(ColorPalette.neutral100),
                )
              ],
            ),
            Expanded(child: Container()),
            InkWell(
              onTap: () => ref.read(OpenGoogleMapsControllerProvider(
                  location: loggedUser.activeVolunteering!['location'])),
              child: const Icon(
                Icons.location_pin,
                color: ColorPalette.primary100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
