// For easy and so that the example dose not get complated with files and directory this file will represent all page class

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_page_example/shared/widgets/body.dart';

class JillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IJillRepository>(() => JillRepository());
    Get.lazyPut(() => JillController(jillRepository: Get.find()));
  }
}

abstract class IJillRepository {
  Future<dynamic> getPageName();
}

class JillRepository implements IJillRepository {
  @override
  Future<dynamic> getPageName() => 2.delay(() => 'Jill Page');
}

class JillController extends GetxController {
  JillController({this.jillRepository});
  final IJillRepository jillRepository;

  final name = 'loading ..'.obs;
  @override
  void onInit() {
    super.onInit();
    jillRepository.getPageName().then((value) => name.value = value);
  }
}

class JillView extends GetView<JillController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text(controller.name.value))),
      body: BodyWidget(),
    );
  }
}