import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Splash/Controller/splashcontroller.dart';
import 'package:login/View/home.dart';
import 'package:login/View/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({
    super.key,
  });

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(
          const Duration(seconds: 3),
          () => Get.to(() => getxController.finalEmail == null
              ? const Signup()
              : const MyHomePage()));
    });
    super.initState();
  }

  final SplashController getxController = Get.find();

  Future<void> getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainemail = sharedPreferences.getString('fullname');
    var obtainfullname = sharedPreferences.getString('email');
    getxController.finalEmail.value = obtainemail ?? '';
    getxController.fullname.value = obtainfullname ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.local_activity),
            ),
          ],
        ),
      ),
    );
  }
}
