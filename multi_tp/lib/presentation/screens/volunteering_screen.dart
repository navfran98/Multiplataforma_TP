import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/application/controllers/logged_user_controller.dart';
import 'package:multi_tp/application/controllers/volunteerings_list_controller.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
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
    final volunteeringsList = ref.watch(volunteeringsListControllerProvider);
    final loggedUser = ref.watch(loggedUserControllerProvider);
    return loggedUser.when(
        data: (loggedUser) {
          return volunteeringsList.when(
            data: (volunteerings) {
              //TODO: sortear como dice la consigna
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
                            style:
                                CustomFont.headline01(ColorPalette.neutral100),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                    renderVolunteering(volunteerings, loggedUser!),
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
            ));
  }

  Widget renderVolunteering(List<Volunteering> volunteerings, User loggedUser) {
    return Expanded(
      child: ListView.builder(
        itemCount: volunteerings.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            minVerticalPadding: 0,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            title: VolunteeringCard(
              volunteering: volunteerings[index],
              user: loggedUser,
            ),
            subtitle: const SizedBox(height: 24),
          );
        },
      ),
    );
  }
}
