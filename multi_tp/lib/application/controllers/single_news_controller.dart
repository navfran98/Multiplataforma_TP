
import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/dtos/news_dto.dart';
import 'package:multi_tp/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../generated/single_news_controller.g.dart';

@riverpod
class SingleNewsController extends _$SingleNewsController {
  @override
  Future<News?> build(id) async {
    final aux = await ref.read(newsRepositoryProvider).findById(id: id);
    logger.w(aux);
    return aux;
  }
}
