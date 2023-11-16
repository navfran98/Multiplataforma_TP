import 'package:multi_tp/data/dtos/volunteering_dto.dart';

abstract interface class VolunteeringRepository {
  // Find volunteering from ID
  Stream<Volunteering?> findById({required String id});

  // Find all volunteerings
  Future<List<Volunteering>> findAllVolunteerings();
}