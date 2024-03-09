import 'dart:async';
import 'dart:io';

import 'package:bilgimizde/components/alarms_functions/wifi_alarm.dart';
import 'package:bilgimizde/main.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionStatusListener {
  //This tracks the current connection status
  bool hasConnection = false;

  //This is how we'll allow subscribing to connection changes
  StreamController connectionChangeController = StreamController.broadcast();

  Stream get connectionChange => connectionChangeController.stream;

  //The test to actually see if there is a connection
  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    //The connection status changed send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }

  //A clean up method to close our StreamController
  //Because this is meant to exist through the entire application life cycle this isn't really an issue
  void dispose() {
    connectionChangeController.close();
  }

  //connectivity_plus
  final Connectivity _connectivity = Connectivity();
  bool showedError = false;
  //flutter_connectivity's listener
  void _connectionChange(ConnectivityResult result) {
    checkConnection().then((value) {
      if (value) {
        print("ok internet");
        showedError = false;
      } else {
        print("bad internet");
        if (!showedError) {
          wifiAlarm(NavigationService.navigatorKey.currentContext!);
          showedError = true;
        }
      }
    });
  }

  //Hook into connectivity_plus's Stream to listen for changes
  //And check the connection status out of the gate
  Future<void> initialize() async {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    await checkConnection();
  }
}
