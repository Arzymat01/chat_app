import 'package:chat_app/src/components/buttons/customButton.dart';
import 'package:chat_app/src/components/logo/animationLogo.dart';
import 'package:chat_app/src/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/text_form_field/textForm_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView(this.isLogin, {Key? key}) : super(key: key);
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const AnimationLogo(
                size: 170,
              ),
              Column(
                children: [
                  CustomTextField(
                    controller: controller.emailCtl,
                    hintext: 'Enter your emai',
                    labaetext: 'Email',
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: controller.passwordCtl,
                    hintext: 'Enter your password',
                    labaetext: 'Password',
                  ),
                ],
              ),
              CustomButton(
                onPressed: () async => await controller.loginRegister(isLogin),
                text: isLogin ? 'Login' : 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
