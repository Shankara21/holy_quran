import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/app/config/themes.dart';
import 'package:holy_quran/app/routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: Get.height * 0.05),
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Holy Quran',
                      style: titleStyle,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Learn Quran and \nRecite once everyday.',
                      style: subtitleStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 46,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          'assets/onboard.png',
                          fit: BoxFit.cover, // Mengatur BoxFit untuk gambar
                        ),
                        Positioned(
                          right: 0,
                          bottom: -24,
                          left: 0,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.offAllNamed(Routes.HOME);
                                // Get.defaultDialog(
                                //   title: 'Enter Your Name',
                                //   content: Column(
                                //     children: [
                                //       TextField(
                                //         // controller: controller.nameController,
                                //         decoration: InputDecoration(
                                //           hintText: 'Enter your name',
                                //         ),
                                //       ),
                                //       const SizedBox(height: 16),
                                //       ElevatedButton(
                                //         onPressed: () {
                                //           // simpan nama ke shared preferences
                                //           // controller.saveName();
                                //           // tutup dialog
                                //           Get.back();
                                //           // pindah ke halaman berikutnya
                                //           Get.offAllNamed(Routes.HOME);
                                //         },
                                //         child: Text('Save'),
                                //       ),
                                //     ],
                                //   ),
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                //height of the button
                                fixedSize: Size(200, 50),
                                backgroundColor: appOrange,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                    color: primaryDarkColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
