import 'package:fight_number/controller/splash_controller.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/values/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: []);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.bg),
            fit: BoxFit.cover,
          ),
        ),
        width: Utils.getWidth(),
        height: Utils.getHeight(),
        child: Padding(
          padding: EdgeInsets.only(
            top: 4.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon()
              // Padding(
              //   padding: EdgeInsets.only(top: 4.h),
              //   child: Column(
              //     children: [
              //       Image.asset(
              //         Images.icLogoApp,
              //         fit: BoxFit.fill,
              //         width: 60.w,
              //       ),
              //       const SizedBox(
              //         height: 24,
              //       ),
              //       Text(
              //         'Lerne deine\nFreunde kennen!',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 20.sp,
              //           fontFamily: 'ComicNeue-Bold',
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 55.h,
              //   width: Utils.getWidth(),
              //   child: Image.asset(
              //     Images.icGirl,
              //     fit: BoxFit.fitWidth,
              //     width: Utils.getWidth(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
