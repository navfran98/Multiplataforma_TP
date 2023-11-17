
import 'package:geolocator/geolocator.dart';

abstract interface class LocationRepository {
  Future<bool> hasPermission();

  Future<Position?> getLocation();

}
