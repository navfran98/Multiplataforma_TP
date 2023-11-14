
import 'package:multi_tp/data/datasources/news_dao.dart';
import 'package:multi_tp/data/dtos/news_dto.dart';
import 'package:multi_tp/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({required this.newsDao});
  final NewsDao newsDao; 

  @override
  Future<List<News>> findAllNews() async {
    return await newsDao.findAllNews();
  }

  @override
  Future<News?> findById({required String id}) async {
    return await newsDao.findById(id: id);
  }

  
}
