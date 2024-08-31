import 'package:crypto_tracker_1/Data/Responce/Status.dart';

import 'package:crypto_tracker_1/Model/Home/Cryptolistmodel.dart';
import 'package:crypto_tracker_1/Repositories/Crypto_list_repo.dart';
import 'package:crypto_tracker_1/Resources/Apptheme/Apptheme.dart';
import 'package:crypto_tracker_1/Resources/Components/widgets/Internet_Exception_widget.dart';
import 'package:crypto_tracker_1/Resources/Components/widgets/Showdata.dart';
import 'package:crypto_tracker_1/Resources/Routes/Routenames.dart';
import 'package:crypto_tracker_1/View/Detailspage/Detailspage.dart';
import 'package:crypto_tracker_1/Viewmodel/Controllers/Cryptolist_controller/cryptolistcontroller.dart';
import 'package:crypto_tracker_1/Viewmodel/Controllers/pagecontroller.dart/pagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

import '../../Viewmodel/Controllers/themecontroller/Themecontroller.dart';

class HOmescreen extends StatefulWidget {
  const HOmescreen({super.key});

  @override
  State<HOmescreen> createState() => _HOmescreenState();
}

class _HOmescreenState extends State<HOmescreen> {
  final Page_View_controller pageviewController =
      Get.put(Page_View_controller());
  final themecontroller themecontrol = Get.put(themecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        (() => MoltenBottomNavigationBar(
        
              selectedIndex: pageviewController.selectedIndex.toInt(),
              barColor: Theme.of(context).backgroundColor,
              onTabChange: (clickedIndex) {
                pageviewController.changePage(clickedIndex);
              },
              tabs: [
                MoltenTab(
                  icon: Icon(
                    Icons.paid,
                    size: Theme.of(context).iconTheme.size,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                MoltenTab(
                  icon: Icon(
                    Icons.favorite,
                    size: Theme.of(context).iconTheme.size,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                MoltenTab(
                  icon: Icon(
                    Icons.wallet_rounded,
                    size: Theme.of(context).iconTheme.size,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            )),
      ),
      //  backgroundColor: Theme.of(context).backgroundColor,

      body: Obx(() =>
          pageviewController.pages[pageviewController.selectedIndex.value]),
    );
  }
}
