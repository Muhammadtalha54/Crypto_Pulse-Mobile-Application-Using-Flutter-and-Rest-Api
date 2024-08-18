import 'package:get/get.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:hex/hex.dart';
import 'package:flutter/foundation.dart';

abstract class walletaddressservice {
  String generateMnemonic();

  Future<String> getPrivateKey(String mnemonic);
  Future<EthereumAddress> getPublicKey(String privatekey);
}

class walletcontroller1 extends GetxController implements walletaddressservice {
  RxBool isVerified = false.obs;

  Future<void> verifyMnemonic(String mnemonic, String input) async {
    if (input.trim() == mnemonic.trim()) {
      await getPrivateKey(mnemonic); // Assuming this is already defined
      isVerified.value = true;
      print(isVerified.value);
    }
  }
  // variable to store the private key

  String? privatekey;
  //function for the load private key
  Future<void> loadPrivatekey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    privatekey = prefs.getString('privatekey');
  }

  //function to save private key
  Future<void> Setprivatekey(String privatekey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('privatekey', privatekey);
  }

  @override
  String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  @override
  Future<String> getPrivateKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    final privatekey = HEX.encode(master.key);
    await Setprivatekey(privatekey);
    return privatekey;
  }

  @override
  Future<EthereumAddress> getPublicKey(String privatekey) async {
    final private = EthPrivateKey.fromHex(privatekey);
    final address = await private.address;
    return address;
  }
}
