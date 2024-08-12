import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twezhinawa/view/Home.dart';

import 'package:twezhinawa/view/onbord/onboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

int? isviewed;

class _SplashScreenState extends State<SplashScreen> {
  _storeOnBoardingInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isviewed!);
  }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => isviewed != 0 ? OnBoard() : Home(),
            )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 250.0),
          child: Center(
            child: Container(
              height: 400,
              width: 220,
              child: ListView(children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/Bazw_free-file.png',
                      height: 200,
                      width: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 105.0),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                            Color.fromARGB(255, 96, 105, 96)),
                      ),
                    )
                  ],
                ),
              ]),
            ),
          ),
        ),
      ]),
    );
  }
}
