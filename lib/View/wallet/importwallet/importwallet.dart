import 'package:crypto_tracker_1/Viewmodel/Controllers/import_walletcontroller/importwalletcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ImportWallet extends StatelessWidget {
  ImportWallet({Key? key}) : super(key: key);

  final ImportWalletController importWalletController =
      Get.put(ImportWalletController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Import from Seed'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Please Enter your mnemonic phrase:',
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 24.0),
                TextField(
                  onChanged: (value) {
                    importWalletController.verificationText.value =
                        value; // Set value directly
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter mnemonic phrase',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => importWalletController.verifyMnemonic(),
                  child: const Text('Import'),
                ),
                const SizedBox(height: 24.0),
              ],
            )));
  }
}
