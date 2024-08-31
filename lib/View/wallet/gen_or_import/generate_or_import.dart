import 'package:crypto_tracker_1/Resources/Routes/Routenames.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateOrImportPage extends StatelessWidget {
  const CreateOrImportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              alignment: Alignment.center,
              child: Text(
                'Moralis Wallet',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 24.0),

            // Logo
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: SizedBox(
                width: 150,
                height: 200,
                child: Image.asset(
                  'assets/images/moralis.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 50.0),

            // Login button
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteNames.GenerateMnemonicPage);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Customize button background color
                foregroundColor: Colors.white, // Customize button text color
                padding: const EdgeInsets.all(16.0),
              ),
              child: const Text(
                'Create Wallet',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),

            const SizedBox(height: 16.0),

            // Register button
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteNames.ImportWallet);
                // Add your register logic here
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ImportWallet(),
                //   ),
                // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.white, // Customize button background color
                foregroundColor: Colors.black, // Customize button text color
                padding: const EdgeInsets.all(16.0),
              ),
              child: const Text(
                'Import from Seed',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),

            const SizedBox(height: 24.0),

            // Footer
            Container(
              alignment: Alignment.center,
              child: const Text(
                '© 2023 Moralis. All rights reserved.',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
