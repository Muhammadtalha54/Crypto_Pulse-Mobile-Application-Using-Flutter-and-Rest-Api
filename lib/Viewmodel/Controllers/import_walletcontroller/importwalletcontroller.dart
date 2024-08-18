import 'package:get/get.dart';


import '../../../Resources/Routes/Routenames.dart';
import '../walletcontroller/walletcontroller.dart';

class ImportWalletController extends GetxController {
  var verificationText = ''.obs; // Use RxString for single observable string
  var isVerified = false.obs;

  Future<void> verifyMnemonic() async {
    final walletController = Get.find<walletcontroller1>();

    final privateKey =
        await walletController.getPrivateKey(verificationText.value);

    isVerified.value = privateKey.isNotEmpty;

    // Navigate to the WalletPage if verified
    if (isVerified.value) {
      Get.toNamed(RouteNames.WalletPage);
    }
  }
}
