
import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
import 'package:multi_tp/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../generated/single_volunteering_controller.g.dart';

@riverpod
class SingleVolunteeringController extends _$SingleVolunteeringController {
  @override
  Future<Volunteering?> build(id) async {
    final aux = await ref.read(volunteeringRepositoryProvider).findById(id: id);
    logger.w(aux);
    return aux;
  }
}
