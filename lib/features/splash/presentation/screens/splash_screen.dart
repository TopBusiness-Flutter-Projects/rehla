import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rehla/core/utils/app_colors.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../navigation_bottom/screens/navigation_bottom.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 1300),
        child: NavigationBottom(),
      ),
    );
    }


  _startDelay() async {

    _timer = Timer(const Duration(milliseconds: 3000), () => _goNext());
  }


  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:
            Padding(
              padding: EdgeInsets.only(bottom: 50),
            child: Image.asset(
              ImageAssets.rehlaLogo,
              width: 200,
            ),
          )),
        ],
      ),
    );
  }
}
