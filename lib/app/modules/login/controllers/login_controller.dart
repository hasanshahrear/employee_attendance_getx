import 'dart:convert';
import 'package:employee_attendance_getx/app/data/models/login_model.dart';
import 'package:employee_attendance_getx/app/data/preference.dart';
import 'package:employee_attendance_getx/app/data/providers/api_provider.dart';
import 'package:employee_attendance_getx/app/data/services/auth.dart';
import 'package:employee_attendance_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final apiProvider = ApiProvider();
  RxBool loading = false.obs;
  RxBool rememberMeFlag = false.obs;
  RxBool obscureText = true.obs;
  late TextEditingController phoneController, passwordController;
  LoginModel? user;

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    if (Preference.getRememberMeFlag()) {
      phoneController.text = Preference.getLoginPhone();
      passwordController.text = Preference.getLoginPass();
    }
  }

  @override
  void onClose() {
    super.onClose();
    phoneController.dispose();
    passwordController.dispose();
  }

  Future<void> login() async {
    try {
      var response = await AuthService.login(
        phone: phoneController.text,
        pass: passwordController.text,
      );

      user = loginModelFromJson(
        jsonEncode(response),
      );

      if (user?.token != null) {
        final token = user?.token;
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token!);
        Get.snackbar(
          'Success',
          'Login Successful',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
        );
        if (rememberMeFlag.value) {
          Preference.setLoginPhone(phoneController.text);
          Preference.setLoginPass(passwordController.text);
          Preference.setRememberMeFlag(true);
          Preference.setLoggedInFlag(true);
        }
        Get.toNamed(Routes.HOME);
      } else {
        Get.snackbar(
          'Failed',
          "Invalid User!",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Failed',
        "Invalid User!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
      );
    }
  }

  void checkMark() {
    rememberMeFlag.toggle();
  }

  void showPassword() {
    obscureText.toggle();
  }
}
