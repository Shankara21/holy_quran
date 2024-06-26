import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/themes.dart';
import 'package:holy_quran/app/data/models/surah.dart';
import 'package:holy_quran/app/routes/app_pages.dart';

import '../controllers/quran_controller.dart';

class QuranView extends GetView<QuranController> {
  const QuranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(QuranController());
    controller.getDateNow();
    controller.getUsername();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  'Assalamualaikum',
                  style: titleStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                Obx(
                  () => Text(
                    controller.username.value != ''
                        ? controller.username.value
                        : 'User',
                    textAlign: TextAlign.start,
                    style: titleStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => Text(
                  '${controller.dateHijri.value.namabulan} ${controller.dateHijri.value.tanggal}, ${controller.dateHijri.value.tahun} H',
                  style: titleStyle.copyWith(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: Stack(
                  children: [
                    Image.asset('assets/last_read.png'),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/quran.png',
                                width: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Last Read',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Al-Fatihah',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Ayah no : 7',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 14,
                                  color: Colors.white,
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
              const SizedBox(
                height: 10,
              ),
              TabBar(
                tabs: const [
                  Tab(
                    text: 'Surah',
                  ),
                  Tab(
                    text: 'Juz',
                  ),
                  Tab(
                    text: 'Bookmarks',
                  )
                ],
                labelColor: appBlue,
                unselectedLabelColor: appGray,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: appBlue,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FutureBuilder<List<Surah>>(
                      future: controller.getAllSurah(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          );
                        }
                        if (!snapshot.hasData) {
                          return const Center(
                            child: Text("Data tidak ditemukan"),
                          );
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Surah surah = snapshot.data![index];
                            return ListTile(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_SURAH, arguments: {
                                  'id': surah.nomor,
                                  'surah': surah
                                });
                              },
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/border.png',
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    surah.nomor.toString(),
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                "Surah  ${surah.namaLatin}",
                                style: primaryTextStyle,
                              ),
                              subtitle: Text(
                                "${surah.jumlahAyat} Ayat | ${surah.tempatTurun}",
                                style: secondaryTextStyle,
                              ),
                              trailing: Text(
                                surah.nama,
                                style: arabicStyle,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const Center(
                      child: Text('Coming Soon!'),
                    ),
                    const Center(
                      child: Text('Bookmarks'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
