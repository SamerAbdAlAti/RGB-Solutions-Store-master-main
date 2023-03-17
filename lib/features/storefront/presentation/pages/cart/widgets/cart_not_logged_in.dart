import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CartNotLoggedIn extends StatelessWidget {
  const CartNotLoggedIn({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20, bottom: 50),
      child: Center(
          child: SizedBox(
              width: screenSize.width * 0.75,
              child: Column(
                children: [
                  const Text("انشئ حسابك وإبدء رحلتك"),
                  const SizedBox(height: 30),
                  SizedBox(
                      width: 200,
                      height: 200,
                      child: Lottie.network(
                          'https://assets10.lottiefiles.com/packages/lf20_5kr5npck.json',
                          fit: BoxFit.cover)),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        Beamer.of(context).beamToNamed('/register');
                      },
                      child: const Text("انشئ حسابك")),
                ],
              ))),
    );
  }
}
