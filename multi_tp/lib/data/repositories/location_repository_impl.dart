

import 'package:geolocator/geolocator.dart';
import 'package:multi_tp/domain/repositories/location_repository.dart';
import 'package:multi_tp/utils/logger.dart';

class LocationRepositoryImpl implements LocationRepository {
  Future<bool> hasPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    return true;
  }

  Future<Position?> getLocation() async {
    // Obtener la ubicación
    try {
      Position position = await Geolocator.getCurrentPosition();
      logger.i('Ubicación actual: ${position.latitude}, ${position.longitude}');
      return position;
    } catch (e) {
      logger.e('Error al obtener la ubicación: $e');
      return null;
    }
  }
  
}