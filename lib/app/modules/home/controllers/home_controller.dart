import 'package:employee_attendance_getx/app/data/models/login_model.dart';
import 'package:employee_attendance_getx/app/data/preference.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  // variables
  RxDouble longitude = 0.0.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble distanceInMeters = 0.0.obs;
  RxDouble offLongitude = 0.0.obs;
  RxDouble offLatitude = 0.0.obs;
  RxBool isSetLocation = false.obs;

  // user info
  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString designation = "".obs;
  RxString phone = "".obs;
  RxString officeAddress = "".obs;

  late LoginModel userInfo;

  // location isSet or not
  Future<void> getUserInfo() async {
    userInfo = Preference.getUserDetails();
    isSetLocation.value = userInfo.location!;
    firstName.value = userInfo.user?.firstName! as String;
    lastName.value = userInfo.user?.lastName! as String;
    designation.value = userInfo.user?.designation! as String;
    phone.value = userInfo.user?.phone! as String;
    officeAddress.value = userInfo.user?.officeAddress! as String;
  }

  // phone current location
  Future<void> getLocationData() async {
    try {} catch (e) {
      print(e);
    }
  }

  // office location from db
  Future<void> getOfficeLocation() async {
    try {} catch (e) {
      print(e);
    }
  }

  // update office location
  Future<void> updateOfficeLocation() async {
    try {} catch (e) {
      print(e);
    }
  }

  // calculate distance between office and phone location
  Future<void> getDistance() async {}

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
