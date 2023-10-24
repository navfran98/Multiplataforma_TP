import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_tp/presentation/design_system/molecules/components/vacante.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/presentation/design_system/tokens/shadows.dart';
import 'package:multi_tp/presentation/screens/single_volunteering_screen.dart';
import 'package:multi_tp/router.dart';
import 'package:multi_tp/utils/logger.dart';

class VolunteeringCard extends ConsumerStatefulWidget {
  const VolunteeringCard({Key? key, required this.id, required this.isFavorite}) : super(key: key);
  final String id;
  final bool isFavorite;
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VolunteeringCardState();
}

class _VolunteeringCardState extends ConsumerState<VolunteeringCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void Function() _handleVolunteering(BuildContext context) {
    return () {
      ref.read(mainBeamerDelegateProvider).beamToNamed(SingleVolunteeringScreen.routeFromId(widget.id));
    };
  }

  void _handleMap() {
    // TODO: open Google Maps with volunteering location
  }

  void  _handleFavorite(BuildContext context) {
    setState(() {
      isFavorite = !isFavorite;
    });
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () => _handleFavorite(context),
                        child: isFavorite ? 
                          const Icon(
                            Icons.favorite,
                            size: 24,
                            color: ColorPalette.primary100) :
                          const Icon(
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
