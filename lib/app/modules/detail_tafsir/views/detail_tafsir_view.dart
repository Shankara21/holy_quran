import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/themes.dart';
import 'package:holy_quran/app/data/models/surah.dart';
import 'package:holy_quran/app/data/models/tafsir_surah.dart';

import '../controllers/detail_tafsir_controller.dart';

class DetailTafsirView extends GetView<DetailTafsirController> {
  final Surah surah = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tafsir ${surah.namaLatin}',
          style: titleStyle.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        children: [
          Stack(
            children: [
              Image.asset('assets/detail.png'),
              Positioned(
                top: 50,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    Text(
                      surah.namaLatin,
                      style: primaryTextStyle.copyWith(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      surah.arti,
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    // garis divider
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Divider(
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          surah.tempatTurun,
                          style: primaryTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '●',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          surah.jumlahAyat.toString() + ' Ayat',
                          style: primaryTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      child: Image.asset('assets/basmallah.png'),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<TafsirSurah>(
            future: controller.getDetailTafsir(surah.nomor),
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
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.tafsir.length,
                itemBuilder: (context, index) {
                  Tafsir ayat = snapshot.data!.tafsir[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                child: Text("${index + 1}"),
                                backgroundColor: appBlue,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.bookmark_add_outlined,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        ayat.teks,
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                        ),
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
    );
  }
}
