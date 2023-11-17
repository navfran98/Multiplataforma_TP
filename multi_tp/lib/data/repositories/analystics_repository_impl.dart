import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:multi_tp/domain/repositories/analytics_repository.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {


  // Constructor
  AnalyticsRepositoryImpl();
  // Factory constructor
  factory AnalyticsRepositoryImpl.instance() => AnalyticsRepositoryImpl();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> sendEvent({required String type, required Map<String, dynamic> data}) async {
    await _analytics.logEvent(name: type, parameters: data);
  }

}