import 'dart:async';
import 'package:employee_attendance_getx/app/modules/home/controllers/home_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationWatch extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startListening();
  }

  // variables
  StreamSubscription<Position>? _positionStream;

  void _startListening() {
    HomeController homeController = Get.find<HomeController>();
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );
    _positionStream = Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
     var dis =  Geolocator.distanceBetween(
        homeController.offLatitude.value,
        homeController.offLongitude.value,
        position.latitude,
        position.longitude,
      );

      print("object");
      print(dis);

    });

  }

  void _stopListening() {
    if (_positionStream != null) {
      _positionStream!.cancel();
      _positionStream = null;
    }
  }
}
