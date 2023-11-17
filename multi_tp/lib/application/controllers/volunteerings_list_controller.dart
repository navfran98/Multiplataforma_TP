import 'package:geolocator/geolocator.dart';
import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'volunteerings_list_controller.g.dart';

@riverpod
class VolunteeringsListController extends _$VolunteeringsListController {
  late List<Volunteering> volunteeringsList;

  @override
  Future<List<Volunteering>> build() async {
    volunteeringsList =
        await ref.read(volunteeringRepositoryProvider).findAllVolunteerings();

    return orderedVolunteerings(volunteeringsList);
  }

  Future<List<Volunteering>> orderedVolunteerings(
      List<Volunteering> volunteerings) async {
    final locationRepository = ref.read(locationRepositoryProvider);
    
    var position;

    if (await locationRepository.hasPermission()) {
      position = await locationRepository.getLocation();
    }

    List<Volunteering> orderedVolunteerings = volunteerings;
    orderedVolunteerings.sort((v1, v2) {

      if(position != null) {
        final distance1 = Geolocator.distanceBetween(
            position.latitude,
            position.longitude,
            v1.location.latitude,
            v1.location.longitude);

        final distance2 = Geolocator.distanceBetween(
            position.latitude,
            position.longitude,
            v2.location.latitude,
            v2.location.longitude);


        return distance1.compareTo(distance2);
      
      }

      v1.creationDate.compareTo(v2.creationDate);
      return v1.title.compareTo(v2.title);
    });
    return orderedVolunteerings;
  }
}
