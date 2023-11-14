import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/dtos/news_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../generated/news_list_controller.g.dart';

@riverpod
class NewsListController extends _$NewsListController {
  late List<News> newsList;

  @override
  Future<List<News>> build() async {
    newsList = await ref.read(newsRepositoryProvider).findAllNews();
    return newsList;
  }


}
