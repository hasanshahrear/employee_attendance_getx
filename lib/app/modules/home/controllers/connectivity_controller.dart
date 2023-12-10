import 'package:employee_attendance_getx/app/data/preference.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  final Rx<ConnectivityResult> connectionStatus =
  Rx<ConnectivityResult>(ConnectivityResult.none);

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _initConnectivity() async {
    final result = await _connectivity.checkConnectivity();
    connectionStatus.value = result;
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    connectionStatus.value = result;

    // Call getOutOfConnection method when status changes
    getOutOfConnection(result);
  }

  void getOutOfConnection(ConnectivityResult status) {
    var isOffTime = Preference.getDataOffTime();
    var isCheckedIn = Preference.getCheckInFlag();

    print(isCheckedIn);

    if (status == ConnectivityResult.none && isCheckedIn == true) {
       DateTime offTime = DateTime.now();
      Preference.setDataOffTime(offTime.toString());
    }

    if (status != ConnectivityResult.none && isOffTime != '') {
      DateTime onTime = DateTime.now();
      print(isOffTime);
      print(onTime.toString());
    }
  }
}
