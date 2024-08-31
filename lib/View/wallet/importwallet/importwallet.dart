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
        body: Container(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Please Enter your mnemonic phrase:',
                      style: Theme.of(context).textTheme.titleMedium!),
                  SizedBox(height: Get.height * 0.02),
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
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () => importWalletController.verifyMnemonic(),
                    child: Text('Import',
                        style: Theme.of(context).textTheme.titleMedium!),
                  ),
                  const SizedBox(height: 24.0),
                ],
              )),
        ));
  }
}
