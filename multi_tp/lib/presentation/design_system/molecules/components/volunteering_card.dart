import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/application/controllers/logged_user_controller.dart';
import 'package:multi_tp/application/controllers/open_google_maps_controller.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
import 'package:multi_tp/presentation/design_system/molecules/components/vacante.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/presentation/design_system/tokens/shadows.dart';
import 'package:multi_tp/presentation/screens/single_volunteering_screen.dart';
import 'package:multi_tp/router.dart';

class VolunteeringCard extends ConsumerStatefulWidget {
  const VolunteeringCard(
      {Key? key, required this.volunteering, required this.user})
      : super(key: key);
  final Volunteering volunteering;
  final User user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VolunteeringCardState();
}

class _VolunteeringCardState extends ConsumerState<VolunteeringCard> {
  late Volunteering vol;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    vol = widget.volunteering;
    isFavorite = widget.user.favorites.contains(vol.id);
  }

  void Function() _handleVolunteering(BuildContext context) {
    return () {
      ref
          .read(mainBeamerDelegateProvider)
          .beamToNamed(SingleVolunteeringScreen.routeFromId(vol.id));
    };
  }

  void _handleMap() {
    ref.read(OpenGoogleMapsControllerProvider(
      location: vol.location,
    ));
  }

  void _handleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    if (isFavorite) {
      ref
          .read(loggedUserControllerProvider.notifier)
          .addFavorite(userId: widget.user.id, volunteeringId: vol.id);
    } else {
      ref
          .read(loggedUserControllerProvider.notifier)
          .deleteFavorite(userId: widget.user.id, volunteeringId: vol.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleVolunteering(context),
      child: Container(
        decoration: BoxDecoration(
          color: ColorPalette.neutral0,
          boxShadow: const [
            CustomShadow.shadow02_1(),
            CustomShadow.shadow02_2()
          ],
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
                child: renderVolPic(imageUrl: vol.imageUrl),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vol.type,
                        style:
                            const CustomFont.overline(ColorPalette.neutral75),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        vol.title,
                        style: const CustomFont.subtitle01(
                            ColorPalette.neutral100),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Vacante(number: vol.vacancies),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () => _handleFavorite(),
                        child: isFavorite
                            ? const Icon(Icons.favorite,
                                size: 24, color: ColorPalette.primary100)
                            : const Icon(
                                Icons.favorite_border,
                                size: 24,
                                color: ColorPalette.primary100,
                              ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () => _handleMap(),
                        child: const Icon(
                          Icons.location_pin,
                          size: 24,
                          color: ColorPalette.primary100,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget renderVolPic({required String imageUrl}) {
  return Image.network(
    imageUrl,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) {
      // This widget will be displayed if the image fails to load
      return Image.asset(
        'images/offline_post.jpeg', // Replace 'default_image.png' with your default image asset path
        fit: BoxFit.cover,
      );
    },
  );
}
