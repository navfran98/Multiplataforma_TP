import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_volunteerings_controller.g.dart';

@riverpod
class SearchVolunteeringsController extends _$SearchVolunteeringsController {
  String searchTerm = "";
  late List<Volunteering> filteredVolunteerings;

  @override
  List<Volunteering> build({required List<Volunteering> volunteerings}) {
    filteredVolunteerings = ref
        .read(volunteeringRepositoryProvider)
        .searchVolunteering(search: searchTerm, volunteerings: volunteerings);
    return filteredVolunteerings;
  }
  

  void search({required String term}) {

    ref.read(analyticsRepositoryProvider).sendEvent(type: "Volunteer search",data: {"searchTerm": term});
    
    searchTerm = term;
    
    state = ref
        .read(volunteeringRepositoryProvider)
        .searchVolunteering(search: term, volunteerings: volunteerings);
  }
}
