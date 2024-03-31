import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/themes.dart';

import '../controllers/pray_controller.dart';

class PrayView extends GetView<PrayController> {
  const PrayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(PrayController());
    controller.getDateNow();
    controller.getPrayerTime();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/mosq.png'),
              Positioned(
                left: 0,
                top: 50,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      'Prayer Times',
                      style: titleStyle.copyWith(
                        color: primaryDarkColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => Text(
                                  controller.location['name'],
                                  style: titleStyle.copyWith(
                                      color: primaryDarkColor, fontSize: 18),
                                ),
                              ),
                              Obx(
                                () => Text(
                                  controller.timeNowString.value,
                                  style: titleStyle.copyWith(
                                      color: primaryDarkColor, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Obx(
                                () => Text(
                                  controller.dateNow.value,
                                  style: titleStyle.copyWith(
                                      color: primaryDarkColor, fontSize: 16),
                                ),
                              ),
                              Obx(
                                () => Text(
                                  '${controller.dateHijri.value.namabulan} ${controller.dateHijri.value.tanggal}, ${controller.dateHijri.value.tahun} H',
                                  style: titleStyle.copyWith(
                                      color: primaryDarkColor, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () {
                                  if (controller.nextPrayTime.isEmpty) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Isya',
                                          style: titleStyle.copyWith(
                                            fontSize: 32,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          controller.prayToday['time']?['isya'],
                                          style: titleStyle.copyWith(
                                            fontSize: 52,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.nextPrayTime['name'],
                                          style: titleStyle.copyWith(
                                            fontSize: 32,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          controller.nextPrayTime['time'],
                                          style: titleStyle.copyWith(
                                            fontSize: 52,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Obx(
                                () {
                                  if (controller.nextPrayTime.isEmpty ||
                                      controller.nextPrayTime['difference'] ==
                                          null) {
                                    return const SizedBox();
                                  } else {
                                    String hours = controller
                                        .nextPrayTime['difference']['hours'];
                                    String minutes = controller
                                        .nextPrayTime['difference']['minutes'];
                                    String seconds = controller
                                        .nextPrayTime['difference']['seconds'];

                                    return Text(
                                      '-$hours : $minutes : $seconds',
                                      style: titleStyle.copyWith(
                                        fontSize: 22,
                                        color: Colors.white,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: controller.listPrayTime.isNotEmpty ||
                          controller.prayToday.isNotEmpty
                      ? Column(
                          children: [
                            times(
                              name: 'Imsak',
                              time: controller.prayToday['time']?['imsak'],
                              isCurrent:
                                  controller.listPrayTime.isNotEmpty == true
                                      ? (controller.listPrayTime[0]['name'] ==
                                              'imsak'
                                          ? true
                                          : false)
                                      : false,
                            ),
                            times(
                              name: 'Shubuh',
                              time: controller.prayToday['time']?['subuh'],
                              isCurrent:
                                  controller.listPrayTime.isNotEmpty == true
                                      ? (controller.listPrayTime[0]['name'] ==
                                              'shubuh'
                                          ? true
                                          : false)
                                      : false,
                            ),
                            times(
                              name: 'Terbit',
                              time: controller.prayToday['time']?['terbit'],
                              isCurrent:
                                  controller.listPrayTime.isNotEmpty == true
                                      ? (controller.listPrayTime[0]['name'] ==
                                              'terbit'
                                          ? true
                                          : false)
                                      : false,
                            ),
                            times(
                              name: 'Dhuha',
                              time: controller.prayToday['time']?['dhuha'],
                              isCurrent:
                                  controller.listPrayTime.isNotEmpty == true
                                      ? (controller.listPrayTime[0]['name'] ==
                                              'dhuha'
                                          ? true
                                          : false)
                                      : false,
                            ),
                            times(
                              name: 'Dzuhur',
                              time: controller.prayToday['time']?['dzuhur'],
                              isCurrent:
                                  controller.listPrayTime.isNotEmpty == true
                                      ? (controller.listPrayTime[0]['name'] ==
                                              'dzuhur'
                                          ? true
                                          : false)
                                      : false,
                            ),
                            times(
                              name: 'Ashar',
                              time: controller.prayToday['time']?['ashar'],
                              isCurrent:
                                  controller.listPrayTime.isNotEmpty == true
                                      ? (controller.listPrayTime[0]['name'] ==
                                              'ashar'
                                          ? true
                                          : false)
                                      : false,
                            ),
                            times(
                              name: 'Maghrib',
                              time: controller.prayToday['time']?['maghrib'],
                              isCurrent:
                                  controller.listPrayTime.isNotEmpty == true
                                      ? (controller.listPrayTime[0]['name'] ==
                                              'maghrib'
                                          ? true
                                          : false)
                                      : false,
                            ),
                            times(
                              name: 'Isya',
                              time: controller.prayToday['time']?['isya'],
                              isCurrent:
                                  controller.listPrayTime.isNotEmpty == true
                                      ? (controller.listPrayTime[0]['name'] ==
                                              'isya'
                                          ? true
                                          : false)
                                      : true,
                            ),
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: appBlue,
                          ),
                        ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Padding times({String? name, String? time, bool isCurrent = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        shape: isCurrent
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: appBlue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              )
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name!,
                style: primaryTextStyle,
              ),
              Text(
                time!,
                style: primaryTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
