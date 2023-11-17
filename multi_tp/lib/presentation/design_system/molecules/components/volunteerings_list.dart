import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/application/controllers/search_volunteerings_controller.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
import 'package:multi_tp/presentation/design_system/molecules/components/volunteering_card.dart';

class VolunteeringList extends ConsumerStatefulWidget {
  const VolunteeringList(
      {Key? key, required this.volunteerings, required this.loggedUser})
      : super(key: key);

  final User loggedUser;
  final List<Volunteering> volunteerings;

  @override
  ConsumerState<VolunteeringList> createState() => _VolunteeringListState();
}

class _VolunteeringListState extends ConsumerState<VolunteeringList> {
  @override
  Widget build(BuildContext context) {

    List<Volunteering> filteredVolunteerings = ref.watch(searchVolunteeringsControllerProvider(volunteerings: widget.volunteerings));

    return renderVolunteering(filteredVolunteerings, widget.loggedUser);
  }
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
