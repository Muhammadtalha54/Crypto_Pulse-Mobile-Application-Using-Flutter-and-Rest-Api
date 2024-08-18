import 'package:crypto_tracker_1/Resources/Routes/Routenames.dart';
import 'package:crypto_tracker_1/View/Detailspage/Detailspage.dart';
import 'package:crypto_tracker_1/View/Detailspage/Detailspage2.dart';
import 'package:crypto_tracker_1/View/Homescreen/Homescreen.dart';
import 'package:crypto_tracker_1/View/chartsscreen/chartsscreen.dart';
import 'package:get/get.dart';

import '../../View/Splashscreen/Spalshscreen.dart';
import '../../View/wallet/gen_or_import/generate_or_import.dart';
import '../../View/wallet/generate_mnemonic/generate_mnemonic.dart';
import '../../View/wallet/importwallet/importwallet.dart';
import '../../View/wallet/verify_mnemonic/verify_mnemonic.dart';
import '../../View/wallet/walletdetailpage/walletpage1.dart';

class AppRoutes {
  static List<GetPage<dynamic>> routes() {
    return [
      GetPage(
        name: RouteNames.Splashscreen,
        page: () => Splashscreen(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.leftToRight,
      ),
      GetPage(
        name: RouteNames.Homescreen,
        page: () => HOmescreen(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.leftToRight,
      ),
      GetPage(
        name: RouteNames.Detailsscreen,
        page: () => Detailspage(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
      ),

      GetPage(
        name: RouteNames.chartsscreen,
        page: () => OHLCChartsscreen(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
      ),
       GetPage(
        name: RouteNames.Detailsscreen2,
        page: () => Detailspage2(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
      ),
 GetPage(
        name: RouteNames.CreateOrImportPage,
        page: () => CreateOrImportPage(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.leftToRight,
      ),
      GetPage(
        name: RouteNames.GenerateMnemonicPage,
        page: () => GenerateMnemonicPage(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.leftToRight,
      ),
      GetPage(
        name: RouteNames.ImportWallet,
        page: () => ImportWallet(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.leftToRight,
      ),
       GetPage(
        name: RouteNames.verifymnemonicpage,
        page: () => VerifyMnemonicPage(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.leftToRight,
      ),
       GetPage(
        name: RouteNames.WalletPage,
        page: () => WalletPage(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.leftToRight,
      ),
      // Add more GetPage objects as needed
    ];
  }
}
