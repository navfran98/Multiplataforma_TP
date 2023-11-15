import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../generated/volunteerings_list_controller.g.dart';

@riverpod
class VolunteeringsListController extends _$VolunteeringsListController {
  late List<Volunteering> volunteeringsList;

  @override
  Future<List<Volunteering>> build() async {
    volunteeringsList = await ref.read(volunteeringRepositoryProvider).findAllVolunteerings();
    return volunteeringsList;
  }
}
