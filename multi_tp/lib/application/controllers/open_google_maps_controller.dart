import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multi_tp/application/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'open_google_maps_controller.g.dart';

@riverpod
void openGoogleMapsController(
  OpenGoogleMapsControllerRef ref, {
  required GeoPoint location,
}) async {
  return ref.read(mapsRepositoryProvider).openGoogleMaps(location: location);
}
