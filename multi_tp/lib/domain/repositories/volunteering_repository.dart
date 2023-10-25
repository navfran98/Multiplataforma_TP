import 'package:multi_tp/data/dtos/volunteering_dto.dart';

abstract interface class VolunteeringRepository {
  // Find volunteering from ID
  Future<Volunteering?> findById({required String id});

  // Find all volunteerings
  Future<List<Volunteering>> findAllVolunteerings();
}