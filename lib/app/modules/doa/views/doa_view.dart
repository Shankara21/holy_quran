import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doa_controller.dart';

class DoaView extends GetView<DoaController> {
  const DoaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DoaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DoaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
