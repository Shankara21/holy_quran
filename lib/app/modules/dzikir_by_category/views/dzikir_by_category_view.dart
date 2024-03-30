import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dzikir_by_category_controller.dart';

class DzikirByCategoryView extends GetView<DzikirByCategoryController> {
  const DzikirByCategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DzikirByCategoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DzikirByCategoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
