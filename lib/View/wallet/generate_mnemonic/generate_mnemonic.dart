import 'package:crypto_tracker_1/Resources/Components/widgets/Round_button.dart';
import 'package:crypto_tracker_1/Resources/Routes/Routenames.dart';
import 'package:crypto_tracker_1/Viewmodel/Controllers/walletcontroller/walletcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:http/http.dart';

class GenerateMnemonicPage extends StatelessWidget {
  const GenerateMnemonicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletcontroller = Get.put(walletcontroller1());
    final mnemonic = walletcontroller.generateMnemonic();
    final mnemonicWords = mnemonic.split(' ');

    void copyToClipboard() {
      Clipboard.setData(ClipboardData(text: mnemonic));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mnemonic Copied to Clipboard')),
      );

      Get.toNamed(RouteNames.verifymnemonicpage,
          arguments: {'mnemonic': mnemonic});
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Generate Mnemonic'),
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
            children: [
              const Text(
                'Please store this mnemonic phrase safely:',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 24.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  mnemonicWords.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      '${index + 1}. ${mnemonicWords[index]}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Roundbutton(
                title: "Copy to Clipboard",
                onpress: () {
                  copyToClipboard();
                },
                radius: 30,
                Height: Get.height * 0.07,
                Width: Get.width * 0.7,
                buttoncolor: Colors.amber,
                textcolor: Theme.of(context).iconTheme.color,
                textSize: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
