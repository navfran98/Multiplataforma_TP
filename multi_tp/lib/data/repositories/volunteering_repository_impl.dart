import 'package:multi_tp/data/datasources/volunteering_dao.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
import 'package:multi_tp/domain/repositories/volunteering_repository.dart';

class VolunteeringRepositoryImpl implements VolunteeringRepository {
  VolunteeringRepositoryImpl({required this.volunteeringDao});
  final VolunteeringDao volunteeringDao;

  @override
  Future<List<Volunteering>> findAllVolunteerings() async {
    return await volunteeringDao.findAllVolunteerings();
  }

  @override
  List<Volunteering> searchVolunteering({
  required String search,
  required List<Volunteering> volunteerings,
}) {
  String cleanedSearch = _removeSpecialCharacters(search.toLowerCase());

  return volunteerings.where((vol) {
    String cleanedTitle = _removeSpecialCharacters(vol.title.toLowerCase());
    String cleanedPurpose = _removeSpecialCharacters(vol.purpose.toLowerCase());
    String cleanedDetail = _removeSpecialCharacters(vol.detail.toLowerCase());

    return cleanedTitle.contains(cleanedSearch) ||
        cleanedPurpose.contains(cleanedSearch) ||
        cleanedDetail.contains(cleanedSearch);
  }).toList();
}

String _removeSpecialCharacters(String text) {
  // Remove special characters and symbols
  return text.replaceAll(RegExp(r'[^\w\s]'), '');
}


  @override
  Stream<Volunteering?> findById({required String id}) {
    return volunteeringDao.findById(id: id);
  }
}
