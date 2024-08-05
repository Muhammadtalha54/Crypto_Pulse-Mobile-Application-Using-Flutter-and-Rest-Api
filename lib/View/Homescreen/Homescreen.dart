import 'package:crypto_tracker_1/Data/Responce/Status.dart';

import 'package:crypto_tracker_1/Model/Home/Cryptolistmodel.dart';
import 'package:crypto_tracker_1/Repositories/Crypto_list_repo.dart';
import 'package:crypto_tracker_1/Resources/Apptheme/Apptheme.dart';
import 'package:crypto_tracker_1/Resources/Components/Internet_Exception_widget.dart';
import 'package:crypto_tracker_1/Resources/Components/Showdata.dart';
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

import '../../Resources/Apptheme/Themecontroller.dart';

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
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          
          bottomNavigationBar: // Padding(
              //  padding: const EdgeInsets.only(right: 70, left: 70),
              Padding(
            padding: const EdgeInsets.only(right: 70, left: 70),
            child: GNav(
              padding: EdgeInsets.all(16),
              gap: 8,
              tabShadow: [
                BoxShadow(
                    color: Theme.of(context).primaryColorLight.withOpacity(0.5),
                    blurRadius: 8)
              ],
              onTabChange: (index) {
                pageviewController.changePage(index);
              },
              backgroundColor: Theme.of(context).primaryColor,
              color: Color.fromARGB(255, 0, 0, 0),
              //activeColor: Color.fromARGB(255, 0, 0, 0),
              tabBackgroundColor: Color.fromARGB(93, 201, 200, 200),
              tabs: [
                GButton(
                  icon: Icons.paid,
                  iconSize: Theme.of(context).iconTheme.size,
                  iconColor: Theme.of(context).iconTheme.color,
                  text: "All Crypto",
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
                GButton(
                  icon: Icons.favorite,
                  iconSize: Theme.of(context).iconTheme.size,
                  iconColor: Theme.of(context).iconTheme.color,
                  text: "Favorites",
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
              ],
              //),
            ),
          ),
          body: Obx(() => pageviewController
              .pages[pageviewController.selectedIndex.value])),
    );
  }
}
