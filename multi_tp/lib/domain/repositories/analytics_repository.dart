abstract interface class AnalyticsRepository {

  Future<void> sendEvent({required String type, required Map<String, dynamic> data});

}