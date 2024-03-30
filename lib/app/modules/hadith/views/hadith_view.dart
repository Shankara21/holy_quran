import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/app/config/themes.dart';
import 'package:holy_quran/app/data/models/hadith.dart';
import 'package:holy_quran/app/routes/app_pages.dart';
import '../controllers/hadith_controller.dart';

class HadithView extends GetView<HadithController> {
  const HadithView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Hadith',
              style: titleStyle.copyWith(
                fontSize: 22,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Hadith>>(
        future: controller.getAllHadith(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  int i = index + 1;
                  Hadith hadith = snapshot.data![index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.HADITH_BY_MAHZAB,
                              arguments: hadith);
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: appBlue,
                            child: Text(
                              i.toString(),
                              style: primaryTextStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: Text(
                            hadith.name,
                            style: primaryTextStyle,
                          ),
                          subtitle: Text(
                            "${hadith.available.toString()} Hadith",
                            style: secondaryTextStyle,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(),
                      ),
                    ],
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
