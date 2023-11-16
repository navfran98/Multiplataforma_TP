import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class MapsRepository {
  void openGoogleMaps({required GeoPoint location});
}
