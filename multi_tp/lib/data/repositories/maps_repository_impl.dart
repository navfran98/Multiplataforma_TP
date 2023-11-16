import 'package:cloud_firestore_platform_interface/src/geo_point.dart';
import 'package:multi_tp/domain/repositories/maps_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsRepositoryImpl implements MapsRepository {
  @override
  void openGoogleMaps({required GeoPoint location}) async {
    final uri = Uri(
        scheme: 'https',
        host: 'www.google.com',
        path: '/maps/search/',
        queryParameters: {
          'api': '1',
          'query': '${location.latitude},${location.longitude}'
        });
    final url = uri.toString();
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (e) {
      throw 'Error al ejecutar launch';
    }
  
  }
}
