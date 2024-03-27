import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/themes.dart';
import 'package:holy_quran/app/data/models/surah.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hola culers!'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Surah>>(
        future: controller.getAllSurah(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
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
                  
                },
                leading: CircleAvatar(
                  child: Text(surah.nomor.toString()),
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
    );
  }
}
