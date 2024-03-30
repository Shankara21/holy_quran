import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/themes.dart';
import 'package:holy_quran/app/data/models/bacaan_shalat.dart';
import 'package:holy_quran/app/data/models/niat_shalat.dart';

import '../controllers/shalat_controller.dart';

class ShalatView extends GetView<ShalatController> {
  const ShalatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Doa Shalat',
              style: titleStyle.copyWith(
                fontSize: 22,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(
                  text: 'Niat Shalat',
                ),
                Tab(
                  text: 'Bacaan Shalat',
                ),
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
                  FutureBuilder<List<NiatShalat>>(
                    future: controller.getAllNiatShalat(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                          NiatShalat niatShalat = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: appBlue,
                                    child: Text(
                                      "${niatShalat.id}",
                                      style: primaryTextStyle.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    textAlign: TextAlign.end,
                                    "${niatShalat.arabic}",
                                    style: arabicStyle,
                                  ),
                                  subtitle: Column(
                                    children: [
                                      const SizedBox(height: 5),
                                      Text(
                                        textAlign: TextAlign.end,
                                        "${niatShalat.latin}",
                                        style: secondaryTextStyle,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "${niatShalat.terjemahan}",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Divider(),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  FutureBuilder<List<BacaanShalat>>(
                    future: controller.getAllBacaanShalat(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                          BacaanShalat bacaanShalat = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: appBlue,
                                    child: Text(
                                      "${bacaanShalat.id}",
                                      style: primaryTextStyle.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    textAlign: TextAlign.end,
                                    "${bacaanShalat.arabic}",
                                    style: arabicStyle,
                                  ),
                                  subtitle: Column(
                                    children: [
                                      const SizedBox(height: 5),
                                      Text(
                                        "${bacaanShalat.latin}",
                                        style: secondaryTextStyle,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "${bacaanShalat.terjemahan}",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Divider(),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
