import 'package:crypto_tracker_1/Resources/Components/walletcomponents/get_balance.dart';
import 'package:crypto_tracker_1/Resources/Components/widgets/Header.dart';
import 'package:crypto_tracker_1/Resources/Components/widgets/heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

import '../../../Resources/Components/walletcomponents/nftbalances.dart';
import '../../../Resources/Components/walletcomponents/send_wallet.dart';
import '../../../Viewmodel/Controllers/walletcontroller/walletcontroller.dart';
import '../gen_or_import/generate_or_import.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final TextEditingController addresscontroller = TextEditingController();
  String walletAddress = '';
  String balance = '';
  String pvKey = '';
  final walletcontroller = Get.put(walletcontroller1());

  @override
  void initState() {
    super.initState();
    loadWalletData();
  }

  Future<void> loadWalletData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? privateKey = prefs.getString('privatekey');
    if (privateKey != null) {
      await walletcontroller.loadPrivatekey();
      EthereumAddress address = await walletcontroller.getPublicKey(privateKey);

      print(address.hex);
      setState(() {
        walletAddress = address.hex;

        pvKey = privateKey;
      });
      print(pvKey);
      // String response = await getBalances(address.hex, 'sepolia');
      //  dynamic data = json.decode(response);
      // String newBalance = data['balance'] ?? '0';

      // Transform balance from wei to ether
      // EtherAmount latestBalance = EtherAmount.inWei(BigInt.parse(newBalance));
      // String latestBalanceInEther =
      //     latestBalance.getValueInUnit(EtherUnit.ether).toString();

      // setState(() {
      //   balance = latestBalanceInEther;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(walletAddress);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary, // Primary color from theme
              Theme.of(context)
                  .colorScheme
                  .secondary, // Secondary color from theme
            ],
            begin: Alignment.topLeft, // Gradient direction
            end: Alignment.bottomRight,
            stops: [0.0, 0.74], // Gradient stops
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            cryptoHeader(
                trackerText: "My Portfolio",
                icon: Icons.logout_outlined,
                onIconTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove('privateKey');
                  await walletcontroller.removeverifiedstatus();

                  // ignore: use_build_context_synchronously
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateOrImportPage(),
                    ),
                    (route) => false,
                  );
                }),
            Container(
              height: Get.height * 0.35,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 32.0),
                  const Text(
                    'Balance',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    '\$ 12000.050',
                    style: const TextStyle(
                        fontSize: 35.0, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32.0),
                  const Text(
                    'Wallet Address',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    walletAddress,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    FloatingActionButton(
                      heroTag: 'sendButton', // Unique tag for send button
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SendTokensPage(privateKey: pvKey)),
                        );
                      },
                      child: Icon(
                        Icons.send,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text('Send'),
                  ],
                ),
                Column(
                  children: [
                    FloatingActionButton(
                      heroTag: 'refreshButton', // Unique tag for send button
                      onPressed: () {
                        setState(() {
                          // Update any necessary state variables or perform any actions to refresh the widget
                        });
                      },
                      child: Icon(
                        Icons.replay_outlined,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text('Refresh'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        labelColor: Color.fromARGB(255, 2, 75, 179),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                        tabs: [
                          Tab(text: 'Assets'),
                          Tab(text: 'NFTs'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Assets Tab
                            Column(
                              children: [
                                Card(
                                  color: Color.fromARGB(255, 205, 201, 201),
                                  margin: const EdgeInsets.all(16.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Sepolia ETH',
                                          style: TextStyle(
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          balance,
                                          style: const TextStyle(
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // NFTs Tab
                            SingleChildScrollView(
                                child: NFTListPage(
                                    address: walletAddress, chain: 'sepolia')),
                            // Activities Tab
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
