import 'dart:convert';

import 'package:employee_attendance_getx/app/data/models/login_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    getToken();
  }

  static const String appBaseUrl = "https://online-attendance.vercel.app/api";
  String? token;

  Future<void> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  Future<LoginModel> loginApi(String phone, String password) async {
    try {
      print("test2");
      final response = await post(
        "$appBaseUrl/login",
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        {'phone': phone, 'password': password},
      );


      if (response.status.hasError) {
        // var res = jsonDecode(response as String);
        // print(res);
        print("err1: ${response.statusText}");
        // or print("err1: ${response.bodyString}");
        print("err1");
        // Handle error response
        // You can return an error model or throw an exception
        return LoginModel(); // Replace with appropriate error handling
      } else {
        print("succ1");
        // Handle success response
        return loginModelFromJson(response.bodyString!);
      }
    } catch (e) {
      print("err2");
      var res = jsonDecode(e as String);
      print(res);
      // Handle any exceptions that occurred during the request
      // You can return an error model or throw an exception
      return LoginModel(); // Replace with appropriate error handling
    }
  }
}
