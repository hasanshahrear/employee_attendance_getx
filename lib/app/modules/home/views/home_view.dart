import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:employee_attendance_getx/app/components/InfoCard.dart';
import 'package:employee_attendance_getx/app/components/PunchCard.dart';
import 'package:employee_attendance_getx/app/components/UserInfo.dart';
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
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "WELCOME",
                style: TextStyle(
                  color: Color.fromRGBO(1, 166, 125, 1),
                  letterSpacing: 1,
                ),
              ),
              controller.isSetLocation == true
                  ? OutlinedButton.icon(
                      onPressed: () async {},
                      icon: const Icon(Icons.remove_red_eye_outlined),
                      label: const Text("View Report"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color.fromRGBO(245, 187, 5, 1),
                        side: const BorderSide(
                            color: Color.fromRGBO(245, 187, 5, 1)),
                      ),
                    )
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
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              child: Column(
                children: [
                  Obx((){
                    return UserInfo(
                        name:
                        "${controller.firstName.toString().toUpperCase()} ${controller.lastName.toString().toUpperCase()}",
                        designation: controller.designation.toString(),
                        distance: "Distance - ${controller.distance} M",
                        imgUrl: "assets/img/user.png");
                  }),
                  Row(
                    children: [
                      InfoCard(
                        onTap: () {},
                        icon: Icons.phone,
                        heading: "Phone Number",
                        text1: controller.phone.toString(),
                        text2: "",
                        bgColor: const Color.fromARGB(1000, 245, 63, 5),
                      ),
                      const SizedBox(width: 18.0),
                      InfoCard(
                          onTap: () {},
                          icon: Icons.home_filled,
                          heading: "Office Address",
                          text1: controller.officeAddress.toString(),
                          text2: "",
                          bgColor: const Color.fromARGB(1000, 69, 110, 254)),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  Obx(() {
                    return Row(
                      children: [
                        InfoCard(
                          onTap: () async {
                            await controller.getLocationData();
                          },
                          icon: Icons.location_on,
                          heading: "Current Location",
                          text1: "Longitude: ${controller.longitude}",
                          text2: "Latitude: ${controller.latitude}",
                          bgColor: const Color.fromARGB(1000, 1, 166, 126),
                        ),
                        const SizedBox(width: 18.0),
                        InfoCard(
                          onTap: () async {
                            await controller.getOfficeLocation();
                          },
                          icon: Icons.home_work,
                          heading: "Office Location",
                          text1: "Longitude: ${controller.offLongitude}",
                          text2: "Latitude: ${controller.offLatitude}",
                          bgColor: const Color.fromARGB(1000, 245, 178, 5),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(height: 18.0),
                  Row(
                    children: [
                      PunchCard(
                        onTap: () async {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.question,
                            animType: AnimType.rightSlide,
                            title: 'Are you sure?',
                            desc: '',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () async {
                              await controller.checkIn();
                            },
                          ).show();
                        },
                        icon: Icons.fingerprint,
                        text: "Check In",
                        bgColor: const Color.fromARGB(1000, 0, 0, 0),
                      ),
                      const SizedBox(width: 18.0),
                      PunchCard(
                        onTap: () async {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.question,
                            animType: AnimType.rightSlide,
                            title: 'Are you sure?',
                            desc: '',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () async {
                              await controller.checkOut();
                            },
                          ).show();
                        },
                        icon: Icons.fingerprint,
                        text: "Check Out",
                        bgColor: const Color.fromARGB(1000, 11, 159, 44),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: MaterialButton(
                              onPressed: () async {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.question,
                                  animType: AnimType.rightSlide,
                                  title: 'Are you sure?',
                                  desc: '',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () async {
                                    controller.leave();
                                  },
                                ).show();
                              },
                              // minWidth: (double.infinity),
                              color: Colors.deepPurple,
                              height: (50.0),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: const Text("Leave"),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            flex: 3,
                            child: MaterialButton(
                              onPressed: () async {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.question,
                                  animType: AnimType.rightSlide,
                                  title: 'Are you sure?',
                                  desc: '',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () async {
                                    await controller.logout();
                                  },
                                ).show();
                              },
                              // minWidth: (double.infinity),
                              color: Colors.brown,
                              height: (50.0),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: const Text("Station Leave"),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            flex: 2,
                            child: MaterialButton(
                              onPressed: () async {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.question,
                                  animType: AnimType.rightSlide,
                                  title: 'Are you sure?',
                                  desc: '',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () async {
                                    await controller.logout();
                                  },
                                ).show();
                              },
                              // minWidth: (double.infinity),
                              color: const Color.fromRGBO(244, 12, 68, 1),
                              height: (50.0),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: const Text("Log out"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
