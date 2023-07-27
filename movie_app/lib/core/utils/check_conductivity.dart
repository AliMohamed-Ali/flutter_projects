// import 'package:connectivity_plus/connectivity_plus.dart';

// class ConnectivityUtils {
//   static Future<bool> hasInternetConnection() async {
//     final connectivityResult = await Connectivity().checkConnectivity();
//     return connectivityResult != ConnectivityResult.none;
//   }
// }

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityUtils {
  static Stream<bool> onInternetStatusChange() async* {
    await for (var result in Connectivity().onConnectivityChanged) {
      yield result != ConnectivityResult.none;
    }
  }

  static Future<bool> hasInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
