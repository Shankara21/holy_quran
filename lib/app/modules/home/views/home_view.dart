import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:holy_quran/app/config/themes.dart';
import 'package:holy_quran/app/data/models/surah.dart';
import 'package:holy_quran/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    fontSize: 20,
                  ),
                ),
                Obx(
                  () => Text(
                    controller.date.value.toString(),
                    style: titleStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: Stack(
                  children: [
                    Image.asset('assets/last_read.png'),
                    Padding(
                      padding: EdgeInsets.all(20),
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
                                'Ayah no : 207',
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
                height: 20,
              ),
              TabBar(
                tabs: const [
                  Tab(
                    text: 'Surah',
                  ),
                  Tab(
                    text: 'Doa',
                  ),
                  Tab(
                    text: 'Tafsir',
                  ),
                  Tab(
                    text: 'Juz',
                  )
                ],
                labelColor: appBlue,
                unselectedLabelColor: appGray,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: appBlue,
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
                                Get.toNamed(Routes.DETAIL_SURAH,
                                    arguments: surah);
                              },
                              leading: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/border.png',
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(surah.nomor.toString(),
                                      style: primaryTextStyle.copyWith()),
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
                    Center(
                      child: Text('Doa'),
                    ),
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
                                Get.toNamed(Routes.DETAIL_TAFSIR,
                                    arguments: surah);
                              },
                              leading: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/border.png',
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(surah.nomor.toString(),
                                      style: primaryTextStyle.copyWith()),
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
                    Center(
                      child: Text('Juz'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () => controller.changeTheme(),
        child: Obx(
          () => Icon(
            controller.isDark.value ? Icons.nightlight_round : Icons.wb_sunny,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
