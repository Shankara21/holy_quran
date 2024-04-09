import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/themes.dart';

import '../controllers/doa_page_controller.dart';

class DoaPageView extends GetView<DoaPageController> {
  const DoaPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DoaPageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('DoaPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Obx(
            () => GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                controller.listDoa.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Get.toNamed(controller.listDoa[index]['url']);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              controller.listDoa[index]['icon'],
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              controller.listDoa[index]['title'],
                              style: primaryTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
