import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_of_surah_controller.dart';

class DetailOfSurahView extends GetView<DetailOfSurahController> {
  const DetailOfSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailOfSurahView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailOfSurahView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
