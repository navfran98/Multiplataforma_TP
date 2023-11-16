
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
  Stream<Volunteering?> findById({required String id}) {
    return volunteeringDao.findById(id: id);
  }
}
