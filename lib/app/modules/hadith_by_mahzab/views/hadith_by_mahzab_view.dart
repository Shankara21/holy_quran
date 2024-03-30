import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/app/config/themes.dart';
import 'package:holy_quran/app/data/models/hadith.dart';
import '../controllers/hadith_by_mahzab_controller.dart';

class HadithByMahzabView extends GetView<HadithByMahzabController> {
  final Hadith hadith = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.getUrl(hadith.available, hadith.name,
        hadith.id); // Memanggil getUrl dengan data dari hadith

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Hadith ${hadith.name}',
              style: titleStyle.copyWith(
                fontSize: 22,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.listHadithByMahzab.length,
          itemBuilder: (context, index) {
            final data = controller.listHadithByMahzab[index];
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: appBlue,
                    child: Text(
                      data['id'].toString(),
                      style: primaryTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text(data['name']),
                  subtitle: Text(data['amount']),
                  onTap: () {},
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
