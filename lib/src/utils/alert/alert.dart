import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppDialog {
  static void shoLoading() {
    Get.defaultDialog(content: CupertinoActivityIndicator());
  }

  static Future<void> showAlert(String content, String? title) async {
    await Get.defaultDialog(
      title: title ?? "ALert",
      content: Text(content, textAlign: TextAlign.center),
    );
  }
}
