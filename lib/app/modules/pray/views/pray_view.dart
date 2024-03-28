import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pray_controller.dart';

class PrayView extends GetView<PrayController> {
  const PrayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrayView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PrayView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
