import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/themes.dart';
import 'package:holy_quran/app/data/models/asmaul_husna.dart';
import 'package:holy_quran/app/routes/app_pages.dart';

import '../controllers/dzikir_controller.dart';

class DzikirView extends GetView<DzikirController> {
  const DzikirView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Dzikir',
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
                  text: 'Kumpulan Dzikir',
                ),
                Tab(
                  text: 'Asmaul Husna',
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Obx(
                      () => GridView.count(
                        crossAxisCount: 2,
                        children: List.generate(
                          controller.listDzikir.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.DZIKIR_BY_CATEGORY,
                                      arguments: controller.listDzikir[index]
                                          ['url'],
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        controller.listDzikir[index]['icon'],
                                        width: 120,
                                        height: 120,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        controller.listDzikir[index]['title'],
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder<List<AsmaulHusna>>(
                      future: controller.getAllAsmaulHusna(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          );
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Center(
                            child: Text("Data tidak ditemukan"),
                          );
                        }
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                            ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              AsmaulHusna asmaulHusna = snapshot.data![index];
                              return Card(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    Get.defaultDialog(
                                      title: "Detail Asmaul Husna",
                                      content: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "${asmaulHusna.arabic}",
                                              style: arabicStyle.copyWith(
                                                fontSize: 40,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "${asmaulHusna.latin}",
                                              style: secondaryTextStyle,
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              textAlign: TextAlign.center,
                                              "${asmaulHusna.translationEn}",
                                              style: primaryTextStyle.copyWith(
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              textAlign: TextAlign.center,
                                              '"${asmaulHusna.translationId})"',
                                              style: primaryTextStyle.copyWith(
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text("Tutup"),
                                        ),
                                      ],
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          textAlign: TextAlign.center,
                                          "${asmaulHusna.arabic}",
                                          style: arabicStyle,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          textAlign: TextAlign.center,
                                          "${asmaulHusna.latin}",
                                          style: secondaryTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
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
