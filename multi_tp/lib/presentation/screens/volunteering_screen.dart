import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/application/controllers/logged_user_controller.dart';
import 'package:multi_tp/application/controllers/search_volunteerings_controller.dart';
import 'package:multi_tp/application/controllers/volunteerings_list_controller.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
import 'package:multi_tp/presentation/design_system/molecules/components/currentvolcard.dart';
import 'package:multi_tp/presentation/design_system/molecules/components/novolunteering.dart';
import 'package:multi_tp/presentation/design_system/molecules/components/volunteering_card.dart';
import 'package:multi_tp/presentation/design_system/molecules/components/volunteerings_list.dart';
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
              final searchVolunteerProvider = ref.watch(
                searchVolunteeringsControllerProvider(
                    volunteerings: volunteerings).notifier);

              onChanged(searchTerm) => searchVolunteerProvider.search(term: searchTerm);
              return Container(
                color: ColorPalette.secondary10,
                child: Column(
                  children: [
                    Container(
                      color: ColorPalette.secondary10,
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SearchField(onChanged: onChanged),
                          const SizedBox(
                            height: 32,
                          ),
                          Visibility(
                              visible: loggedUser!.activeVolunteering != null,
                              child: Column(
                                children: [
                                  const Text(
                                    "Tu Actividad",
                                    style: CustomFont.headline01(
                                        ColorPalette.neutral100),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  CurrentVolCard(loggedUser: loggedUser),
                                  const SizedBox(
                                    height: 24,
                                  )
                                ],
                              )),
                          const Text(
                            "Voluntariados",
                            style:
                                CustomFont.headline01(ColorPalette.neutral100),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                    volunteerings.isEmpty ? const NoVolunteering() : VolunteeringList(loggedUser: loggedUser, volunteerings: volunteerings)
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
