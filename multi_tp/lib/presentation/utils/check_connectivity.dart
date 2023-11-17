import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:multi_tp/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_connectivity.g.dart';

@Riverpod(keepAlive: true)
Future<bool> checkConnectivity(CheckConnectivityRef ref) async {
  ConnectivityResult result = await Connectivity().checkConnectivity();
  if (result == ConnectivityResult.none) {
    logger.w("No internet connection");
    return false;
  } else if (result == ConnectivityResult.mobile) {
    logger.i("Mobile internet connection");
    return true;
  } else if (result == ConnectivityResult.wifi) {
    logger.i("Wifi internet connection");
    return true;
  } else {
    logger.w("No internet connection");
    return false;
  }
}
