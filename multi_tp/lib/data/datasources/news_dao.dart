import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_tp/data/dtos/news_dto.dart';
import 'package:multi_tp/utils/logger.dart';

abstract interface class NewsDao {
  // Find user from ID
  Future<News?> findById({required String id});

  Future<List<News>> findAllNews();
}

class NewsDaoImpl extends NewsDao {
  final newsCollection = 'news';

  // Constructor and Factory Constructor
  NewsDaoImpl();
  factory NewsDaoImpl.instance() => NewsDaoImpl();

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

  @override
  Future<List<News>> findAllNews() async {
    final news = await _firestoreInstance.collection(newsCollection).get();
    final newsList =
        news.docs.map((e) => News.fromJson(e.id, e.data())).toList();
    return newsList;
  }

  @override
  Future<News?> findById({required String id}) async {
    final docNews = _firestoreInstance.collection(newsCollection).doc(id);
    final snapshot = await docNews.get();
    if (snapshot.exists) {
      News aux = News.fromJson(id, snapshot.data()!);
      return aux;
    } else {
      return Future.value(null);
    }
  }
}
