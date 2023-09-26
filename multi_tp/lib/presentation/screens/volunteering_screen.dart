import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/presentation/design_system/molecules/components/currentvolcard.dart';
import 'package:multi_tp/presentation/design_system/molecules/components/volunteering_card.dart';
import 'package:multi_tp/presentation/design_system/molecules/inputs/searchfield.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';

class VolunteeringScreen extends ConsumerWidget {
  static const route = "/home/volunteering";
  static const routeName = "volunteering";

  const VolunteeringScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
              color: ColorPalette.secondary10,
              child: Column(
                children: [
                  Container(
                    color: ColorPalette.secondary10,
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SearchField(),
                        SizedBox(
                          height: 32,
                        ),
                        Visibility(
                            visible: true,
                            child: Column(
                              children: [
                                Text(
                                  "Tu Actividad",
                                  style: CustomFont.headline01(
                                      ColorPalette.neutral100),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                CurrentVolCard(),
                                SizedBox(
                                  height: 24,
                                )
                              ],
                            )),
                        Text(
                          "Voluntariados",
                          style: CustomFont.headline01(ColorPalette.neutral100),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                  renderVolunteering(),
                ],
              ),
            );
  }

  Widget renderVolunteering() {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return const ListTile(
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            //TODO: aca iria el id del volunteering actual de la card
            title: VolunteeringCard(id: "1"),
            subtitle: SizedBox(height: 24),
          );
        },
      ),
    );
  }

}