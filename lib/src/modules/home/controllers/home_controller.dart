import 'package:chat_app/src/modules/home/service/home_service.dart';
import 'package:chat_app/src/routes/app_pages.dart';
import 'package:chat_app/src/utils/alert/alert.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  Future<void> logout() async {
    AppDialog.shoLoading();
    await HomeService.logout();
    await Get.offAllNamed(Routes.FLASH_CHAT);
  }

  Future<void> delete() async {
    AppDialog.shoLoading();
    await HomeService.delete();
    await Get.offAllNamed(Routes.FLASH_CHAT);
  }
}
