import 'package:multi_tp/data/dtos/news_dto.dart';

abstract interface class NewsRepository {
  // Find news from ID
  Future<News?> findById({required String id});

  // Find all news
  Future<List<News>> findAllNews();
}