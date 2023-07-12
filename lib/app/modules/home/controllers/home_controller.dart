import 'dart:convert';

import 'package:employee_attendance_getx/app/data/models/get_location_model.dart';
import 'package:employee_attendance_getx/app/data/models/login_model.dart';
import 'package:employee_attendance_getx/app/data/preference.dart';
import 'package:employee_attendance_getx/app/data/services/home.dart';
import 'package:employee_attendance_getx/app/data/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getUserInfo();
    getLocationData();
    getOfficeLocation();
  }

  // variables
  RxDouble longitude = 0.0.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble distanceInMeters = 0.0.obs;
  RxDouble offLongitude = 0.0.obs;
  RxDouble offLatitude = 0.0.obs;
  RxBool isSetLocation = false.obs;
  RxString token = "".obs;
  RxDouble distance = 0.0.obs;

  // user info
  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString designation = "".obs;
  RxString phone = "".obs;
  RxString officeAddress = "".obs;

  // models
  late LoginModel userInfo;
  late LocationModel? officeLocation;

  // location isSet or not
  void getUserInfo() async {
    userInfo = Preference.getUserDetails();
    isSetLocation.value = userInfo.location!;
    token.value = userInfo.token!;
    firstName.value = userInfo.user?.firstName! as String;
    lastName.value = userInfo.user?.lastName! as String;
    designation.value = userInfo.user?.designation! as String;
    phone.value = userInfo.user?.phone! as String;
    officeAddress.value = userInfo.user?.officeAddress! as String;
  }

  // phone current location
  Future<void> getLocationData() async {
    try {
      Location location = Location();
      await location.getCurrentLocation();
      longitude.value = location.longitude;
      latitude.value = location.latitude;
      Get.snackbar(
        'Success',
        'Location Updated',
        backgroundColor: const Color.fromARGB(1000, 1, 166, 126),
        colorText: Colors.white,
        icon: const Icon(
          Icons.check_circle,
          color: Colors.white,
        ),
      );
    } catch (e) {
      Get.snackbar(
        'Failed',
        'Enable Location Services',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check_circle,
          color: Colors.white,
        ),
      );
    }
  }

  // office location from db
  Future<void> getOfficeLocation() async {
    try {
      var response = await HomeService.getOfficeLocation(token: token.value);
      officeLocation = locationModelFromJson(jsonEncode(response));
      offLongitude.value = officeLocation?.data?.longitude as double;
      offLatitude.value = officeLocation?.data?.latitude as double;
      Get.snackbar(
        'Success',
        'Office Location Updated',
        backgroundColor: const Color.fromARGB(1000, 245, 178, 5),
        colorText: Colors.white,
        icon: const Icon(
          Icons.check_circle,
          color: Colors.white,
        ),
      );
    } catch (e) {
      Get.snackbar(
        'Failed',
        'Something Went Wrong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check_circle,
          color: Colors.white,
        ),
      );
    }
  }

  // update office location
  Future<void> updateOfficeLocation() async {
    try {} catch (e) {
      print(e);
    }
  }

  // calculate distance between office and phone location
  Future<void> getDistance() async {
    if (isSetLocation.value) {
      distance.value = Geolocator.distanceBetween(
        offLatitude.value,
        offLongitude.value,
        latitude.value,
        longitude.value,
      );

    }
  }

  // check in
  Future<void> checkIn() async {
    try {} catch (e) {
      print(e);
    }
  }

  // check out
  Future<void> checkOut() async {
    try {} catch (e) {
      print(e);
    }
  }

  void leave() async {
    try {} catch (e) {
      print(e);
    }
  }

  // logout
  Future<void> logout() async {
    try {} catch (e) {
      print(e);
    }
  }
}
