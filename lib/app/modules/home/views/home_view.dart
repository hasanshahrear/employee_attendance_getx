import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Dashboard",
              style: TextStyle(color: Colors.black),
            ),
            controller.isSetLocation == true
                ? const Text("")
                : OutlinedButton.icon(
              onPressed: () async {
                await controller.updateOfficeLocation();
                controller.getOfficeLocation();
              },
              icon: const Icon(Icons.add_location_alt_outlined),
              label: const Text("Set Location"),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromRGBO(245, 187, 5, 1),
                side: const BorderSide(
                    color: Color.fromRGBO(245, 187, 5, 1)),
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
