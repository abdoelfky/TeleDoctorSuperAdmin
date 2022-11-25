import 'dart:async';
import 'package:flutter/material.dart';
import 'package:teledoctor/shared/component/components.dart';
import 'package:teledoctor/shared/constants/constants.dart';

import 'onBoarding_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? _timer;

  _startDelay(){
    _timer =Timer(const Duration(seconds:3),_getNext);
  }
  _getNext(){
    navigateAndEnd(context, OnBoardingScreen());
  }
  @override
  void initState() {
    super.initState();
    _startDelay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primaryColor,
      body: const Center(
        child: Image(
          color: Colors.white,
          image: AssetImage(
            'assets/images/loginLogo.png',

          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}