import 'dart:developer';
import 'package:chat_app/src/modules/login/services/login_services.dart';
import 'package:chat_app/src/routes/app_pages.dart';
import 'package:chat_app/src/service/user_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/alert/alert.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailCtl = TextEditingController();
  final passwordCtl = TextEditingController();

  final count = 0.obs;

  Future<void> loginRegister(bool isLogin) async {
    if (formKey.currentState!.validate() &&
        GetUtils.isEmail(emailCtl.text) &&
        GetUtils.isPassport(passwordCtl.text)) {
      AppDialog.shoLoading();
      final user = isLogin
          ? await LoginServices.login(emailCtl.text, passwordCtl.text)
          : await LoginServices.register(emailCtl.text, passwordCtl.text);
      Get.back();

      if (user != null) {
        await userManage.setUid(user.user!.uid);
        await Get.offAndToNamed(Routes.HOME);
      } else {
        AppDialog.showAlert(
          isLogin
              ? 'Логин же паролдо ката бар'
              : 'Ката бар.Кайрадан катоодон отунуз',
          'Error',
        );
      }
    } else {
      log('Error');
    }
  }
}
