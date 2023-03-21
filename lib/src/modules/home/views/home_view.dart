import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/message/sendMessage.dart';
import '../../../components/message/streamMessage.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚡️Chat'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () async {
                        await controller.logout();
                      },
                      child: const Text('Aккаунттан Чыгуу'),
                    ),
                    PopupMenuItem(
                      onTap: () async {
                        await controller.delete();
                      },
                      child: const Text('Aккаунтты очуруу'),
                    ),
                  ])
        ],
      ),
      body: Column(
        children: [
          StringMessage(controller.streamMessege()),
          SendMessage(
            controller.textcontroller,
            onPressed: () async => controller.sendMessage(),
          ),
        ],
      ),
    );
  }
}
