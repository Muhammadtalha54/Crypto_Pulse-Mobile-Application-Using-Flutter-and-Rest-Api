import 'package:crypto_tracker_1/Resources/Routes/Routenames.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Viewmodel/Controllers/walletcontroller/walletcontroller.dart';

class VerifyMnemonicPage extends StatefulWidget {
  @override
  _VerifyMnemonicPageState createState() => _VerifyMnemonicPageState();
}

class _VerifyMnemonicPageState extends State<VerifyMnemonicPage> {
  bool isVerified = false;
  String verificationText = '';
  late String mnemonic;
  final walletcontroller = Get.put(walletcontroller1());

  @override
  void initState() {
    super.initState();
    // Retrieve the mnemonic from Get.arguments
    mnemonic = Get.arguments['mnemonic'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    void navigateToWalletPage() {
      Get.toNamed(RouteNames.Homescreen);
    }

    void error() {
      Get.snackbar("Error verifying the mneminic phrase", "message)");
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Verify Mnemonic and Create'),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // Primary color from theme
              Theme.of(context)
                  .colorScheme
                  .secondary, // Secondary color from theme
              Theme.of(context).colorScheme.primary,
            ],
            begin: Alignment.topLeft, // Gradient direction
            end: Alignment.bottomRight,
            stops: [0.3, 0.8], // Gradient stops
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Please verify your mnemonic phrase:',
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 24.0),
                Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10), // Keep borderRadius for the container
                  ),
                  child: TextField(
                    maxLines: 7,
                    onChanged: (value) {
                      verificationText = value;
                      print(verificationText);
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter mnemonic phrase',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Match the container's borderRadius
                        borderSide: BorderSide(
                            color: Colors.black,
                            width: 2), // Set the border color and width
                      ),
                      contentPadding: EdgeInsets.all(
                          8), // Adjust padding for text positioning
                    ),
                    textAlignVertical: TextAlignVertical
                        .top, // Align text to the top-left corner
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    walletcontroller.verifyMnemonic(mnemonic, verificationText);
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  child: const Text('Verify'),
                ),
                const SizedBox(height: 24.0),
                Obx(() => ElevatedButton(
                      onPressed: walletcontroller.isVerified.value
                          ? navigateToWalletPage
                          : error,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      child: const Text('Next'),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
