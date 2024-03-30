import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/themes.dart';
import 'package:holy_quran/app/data/models/doa.dart';

import '../controllers/doa_controller.dart';

class DoaView extends GetView<DoaController> {
  const DoaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Kumpulan Doa',
              style: titleStyle.copyWith(
                fontSize: 22,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(
                  text: 'Harian',
                ),
                Tab(
                  text: 'Quran',
                ),
                Tab(
                  text: 'Lainnya',
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
                  FutureBuilder<List<Doa>>(
                    future: controller.getAllDoaHarian(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.blue,
                          ),
                        );
                      }
                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text("Data tidak ditemukan"),
                        );
                      }
                      return ListView.builder(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Doa doa = snapshot.data![index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Card(
                                child: IntrinsicHeight(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          child: Text(
                                            "${index + 1}",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          backgroundColor: appBlue,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            doa.judul,
                                            style: primaryTextStyle,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                textAlign: TextAlign.end,
                                doa.arab,
                                style: arabicStyle.copyWith(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                doa.indo,
                                style: secondaryTextStyle,
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  FutureBuilder<List<Doa>>(
                    future: controller.getAllDoaQuran(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.blue,
                          ),
                        );
                      }
                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text("Data tidak ditemukan"),
                        );
                      }
                      return ListView.builder(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Doa doa = snapshot.data![index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Card(
                                child: IntrinsicHeight(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          child: Text(
                                            "${index + 1}",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          backgroundColor: appBlue,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            doa.judul,
                                            style: primaryTextStyle,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                textAlign: TextAlign.end,
                                doa.arab,
                                style: arabicStyle.copyWith(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                doa.indo,
                                style: secondaryTextStyle,
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  FutureBuilder<List<Doa>>(
                    future: controller.getAllDoa(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.blue,
                          ),
                        );
                      }
                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text("Data tidak ditemukan"),
                        );
                      }
                      return ListView.builder(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Doa doa = snapshot.data![index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Card(
                                child: IntrinsicHeight(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          child: Text(
                                            "${index + 1}",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          backgroundColor: appBlue,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            doa.judul,
                                            style: primaryTextStyle,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                textAlign: TextAlign.end,
                                doa.arab,
                                style: arabicStyle.copyWith(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                doa.indo,
                                style: secondaryTextStyle,
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
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
