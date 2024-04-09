import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/themes.dart';
import 'package:holy_quran/app/data/models/ayat.dart';
import 'package:holy_quran/app/data/models/surah.dart';
import 'package:holy_quran/app/routes/app_pages.dart';

import '../controllers/detail_surah_controller.dart';
import 'package:html/parser.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  DetailSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DetailSurahController());
    DetailSurahController controller = Get.find<DetailSurahController>();
    final Map<String, dynamic>? args = Get.arguments as Map<String, dynamic>?;

    Surah surah;
    int nomor;
    surah = args!['surah'];
    nomor = args['id'];
    var processedDeskripsi = parse(surah.deskripsi);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Surah ${surah.namaLatin}',
          style: titleStyle.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.DETAIL_TAFSIR, arguments: surah);
            },
            icon: const Icon(
              Icons.library_books_outlined,
              size: 28,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        children: [
          GestureDetector(
            onTap: () {
              Get.defaultDialog(
                title: 'Deskripsi Surah',
                middleText: processedDeskripsi.body!.text,
              );
            },
            child: Stack(
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
                            '● ',
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
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.blue[700],
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Play full audio',
                      style: primaryTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    controller.audioStatus == 'stop'
                        ? IconButton(
                            onPressed: () {
                              controller.playAudioSurah(surah);
                            },
                            icon: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              controller.audioStatus == 'play'
                                  ? IconButton(
                                      onPressed: () {
                                        // controller.pauseFullAudio();
                                      },
                                      icon: const Icon(
                                        Icons.pause,
                                        color: Colors.white,
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        // controller.resumeFullAudio();
                                      },
                                      icon: const Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                    ),
                              IconButton(
                                onPressed: () {
                                  // controller.stopFullAudio();
                                },
                                icon: const Icon(
                                  Icons.stop,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder<Surah>(
            future: controller.getDetailSurah(nomor),
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
              var dataSurah = snapshot.data;
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.ayat!.length,
                itemBuilder: (context, index) {
                  Ayat ayat = snapshot.data!.ayat![index];
                  print(ayat.audio);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: appBlue,
                                child: Text("${index + 1}"),
                              ),
                              // GetBuilder<DetailSurahController>(
                              //   builder: (ctx) => Row(
                              //     children: [
                              //       IconButton(
                              //         onPressed: () {},
                              //         icon: const Icon(
                              //           Icons.bookmark_add_outlined,
                              //         ),
                              //       ),
                              //       (ayat.audioStatus == 'stop'
                              //           ? IconButton(
                              //               onPressed: () {
                              //                 ctx.playAudio(ayat);
                              //               },
                              //               icon: const Icon(
                              //                 Icons.play_arrow,
                              //               ),
                              //             )
                              //           : Row(
                              //               mainAxisSize: MainAxisSize.min,
                              //               children: [
                              //                 (ayat.audioStatus == 'play'
                              //                     ? IconButton(
                              //                         onPressed: () {
                              //                           ctx.pauseAudio(ayat);
                              //                         },
                              //                         icon: const Icon(
                              //                           Icons.pause,
                              //                         ),
                              //                       )
                              //                     : IconButton(
                              //                         onPressed: () {
                              //                           ctx.resumeAudio(ayat);
                              //                         },
                              //                         icon: const Icon(
                              //                           Icons.play_arrow,
                              //                         ),
                              //                       )),
                              //                 IconButton(
                              //                   onPressed: () {
                              //                     ctx.stopAudio(ayat);
                              //                   },
                              //                   icon: const Icon(
                              //                     Icons.stop,
                              //                   ),
                              //                 )
                              //               ],
                              //             ))
                              //     ],
                              //   ),
                              // )
                              // GetBuilder<DetailSurahController>(
                              //   builder: (ctx) {
                              //     if (ayat != null) {
                              //       return Row(
                              //         children: [
                              //           IconButton(
                              //             onPressed: () {},
                              //             icon: const Icon(
                              //               Icons.bookmark_add_outlined,
                              //             ),
                              //           ),
                              //           (ayat.audioStatus == 'stop'
                              //               ? IconButton(
                              //                   onPressed: () {
                              //                     ctx.playAudio(ayat);
                              //                   },
                              //                   icon: const Icon(
                              //                     Icons.play_arrow,
                              //                   ),
                              //                 )
                              //               : Row(
                              //                   mainAxisSize: MainAxisSize.min,
                              //                   children: [
                              //                     (ayat.audioStatus == 'play'
                              //                         ? IconButton(
                              //                             onPressed: () {
                              //                               ctx.pauseAudio(
                              //                                   ayat);
                              //                             },
                              //                             icon: const Icon(
                              //                               Icons.pause,
                              //                             ),
                              //                           )
                              //                         : IconButton(
                              //                             onPressed: () {
                              //                               ctx.resumeAudio(
                              //                                   ayat);
                              //                             },
                              //                             icon: const Icon(
                              //                               Icons.play_arrow,
                              //                             ),
                              //                           )),
                              //                     IconButton(
                              //                       onPressed: () {
                              //                         ctx.stopAudio(ayat);
                              //                       },
                              //                       icon: const Icon(
                              //                         Icons.stop,
                              //                       ),
                              //                     )
                              //                   ],
                              //                 ))
                              //         ],
                              //       );
                              //     } else {
                              //       return SizedBox(); // return empty widget if ayat is null
                              //     }
                              //   },
                              // )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.end,
                        ayat.teksArab,
                        style: arabicStyle.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ayat.teksLatin,
                        style: secondaryTextStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        ayat.teksIndonesia,
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (index == snapshot.data!.ayat!.length - 1)
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment:
                                dataSurah!.suratSebelumnya != null
                                    ? MainAxisAlignment.spaceBetween
                                    : MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (dataSurah.suratSebelumnya != null)
                                TextButton(
                                  onPressed: () {
                                    if (dataSurah.suratSebelumnya != null) {
                                      Get.offAndToNamed(
                                        Routes.DETAIL_SURAH,
                                        arguments: {
                                          'surah': controller.prevSurah.value,
                                          'id': dataSurah.suratSebelumnya!.nomor
                                        },
                                      );
                                    }
                                  },
                                  child: Text(
                                    "Back ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .blue, // Warna teks untuk tombol "Back"
                                    ),
                                  ),
                                ),
                              if (dataSurah.suratSelanjutnya != null)
                                TextButton(
                                  onPressed: () {
                                    if (dataSurah.suratSelanjutnya != null) {
                                      Get.offAndToNamed(
                                        Routes.DETAIL_SURAH,
                                        arguments: {
                                          'surah': controller.nextSurah.value,
                                          'id':
                                              dataSurah.suratSelanjutnya!.nomor
                                        },
                                      );
                                    }
                                  },
                                  child: Text(
                                    "Next ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .blue, // Warna teks untuk tombol "Next"
                                    ),
                                  ),
                                ),
                            ],
                          ),
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

  Widget _buildDescriptionText(String description) {
    List<String> parts = description.split(RegExp(r'<\/?i>'));

    List<TextSpan> textSpans = parts.map((part) {
      if (part.startsWith('<i>') && part.endsWith('</i>')) {
        return TextSpan(
          text: part.substring(3, part.length - 4),
          style: TextStyle(fontStyle: FontStyle.italic),
        );
      } else {
        return TextSpan(text: part);
      }
    }).toList();

    return RichText(
      text: TextSpan(children: textSpans),
    );
  }
}
