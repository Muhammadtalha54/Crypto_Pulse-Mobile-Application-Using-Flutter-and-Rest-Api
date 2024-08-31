import 'dart:math';

import 'package:crypto_tracker_1/Resources/Components/widgets/Header.dart';
import 'package:crypto_tracker_1/Resources/Components/widgets/Round_button.dart';
import 'package:crypto_tracker_1/Resources/Components/widgets/heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

import '../textfield/textfield.dart';

class SendTokensPage extends StatelessWidget {
  final String privateKey;
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  SendTokensPage({Key? key, required this.privateKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              cryptoHeader(
                trackerText: "Send Tokens",
              ),
              SizedBox(height: Get.height * 0.1),
              CustomTextField(
                  controller: recipientController,
                  hintText: "   Recipient Address"),
              SizedBox(height: Get.height * 0.05),
              CustomTextField(
                  controller: amountController,
                  hintText: "   Entet the amount"),
              SizedBox(height: Get.height * 0.2),
              Roundbutton(
                  title: "Send",
                  onpress: () {
                    String recipient = recipientController.text;
                    double amount = double.parse(amountController.text);
                    BigInt bigIntValue = BigInt.from(amount * pow(10, 18));
                    print(bigIntValue);
                    EtherAmount ethAmount = EtherAmount.inWei(bigIntValue);
                    //  EtherAmount.fromBigInt(EtherUnit.wei, bigIntValue);
                    print(ethAmount);
                    // Convert the amount to EtherAmount
                    sendTransaction(recipient, ethAmount);
                  },
                  radius: Get.width*0.3,
                  Width: Get.width * 0.8,
                  Height: Get.height * 0.06,
                  buttoncolor: Colors.amber,
                  textSize: Get.width*0.35,
                  textcolor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  void sendTransaction(String receiver, EtherAmount txValue) async {
    var apiUrl = "Your RPC Url"; // Replace with your API
    // Replace with your API
    var httpClient = http.Client();
    var ethClient = Web3Client(apiUrl, httpClient);

    EthPrivateKey credentials = EthPrivateKey.fromHex('0x' + privateKey);

    EtherAmount etherAmount = await ethClient.getBalance(credentials.address);
    EtherAmount gasPrice = await ethClient.getGasPrice();

    print(etherAmount);

    await ethClient.sendTransaction(
      credentials,
      Transaction(
        to: EthereumAddress.fromHex(receiver),
        gasPrice: gasPrice,
        maxGas: 100000,
        value: txValue,
      ),
      chainId: 11155111,
    );
  }
}
