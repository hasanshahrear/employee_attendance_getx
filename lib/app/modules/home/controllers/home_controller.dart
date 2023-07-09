import 'dart:convert';

import 'package:employee_attendance_getx/app/data/models/login_model.dart';
import 'package:employee_attendance_getx/app/data/preference.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    getValue();
  }
  // variable
  var isSetLocation = false.obs;
  RxDouble offLongitude = 0.0.obs;
  RxDouble offLatitude = 0.0.obs;
  late LoginModel userInfo;

  // location isSet or not
  Future<void> getValue() async {
    userInfo = Preference.getUserDetails();
    isSetLocation.value = userInfo.location!;
  }

  // office location from db
  Future<void> getOfficeLocation() async {
    try {

    } catch (e) {
      print(e);
    }
  }

  // update office location
  Future<void> updateOfficeLocation() async {
    try {

    } catch (e) {
      print(e);
    }
  }


}
