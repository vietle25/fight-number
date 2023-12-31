import 'dart:async';

import 'package:fight_number/controller/base_controller.dart';
import 'package:fight_number/controller/category_controller.dart';
import 'package:fight_number/controller/player_controller.dart';
import 'package:fight_number/controller/purchase_controller.dart';
import 'package:fight_number/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class SplashController extends BaseController {
  late StreamSubscription<List<PurchaseDetails>> subscription;

  @override
  void onInit() {
    super.onInit();

    final PlayerController playerController = Get.put(PlayerController());
    final CategoryController categoryController = Get.put(CategoryController());
    final PurchaseController purchaseController = Get.put(PurchaseController());
    // final BoardGameController boardGameController =
    //     Get.put(BoardGameController());
    precacheImage(
        const AssetImage("assets/images/ic_casual.png"), Get.context!);
    precacheImage(const AssetImage("assets/images/card_bg.png"), Get.context!);
    precacheImage(const AssetImage("assets/images/cat.png"), Get.context!);
    precacheImage(
        const AssetImage("assets/images/app_logo_rounded.png"), Get.context!);
    precacheImage(const AssetImage("assets/images/main_bg.png"), Get.context!);
    precacheImage(const AssetImage("assets/images/ic_casual_unselected.png"),
        Get.context!);
    precacheImage(const AssetImage("assets/images/ic_dirty.png"), Get.context!);
    precacheImage(const AssetImage("assets/images/ic_dirty_unselected.png"),
        Get.context!);
    precacheImage(
        const AssetImage("assets/images/ic_dirty_plus.png"), Get.context!);
    precacheImage(
        const AssetImage("assets/images/ic_dirty_plus_unselected.png"),
        Get.context!);
    precacheImage(
        const AssetImage("assets/images/ic_dirty_extreme.png"), Get.context!);
    precacheImage(
        const AssetImage("assets/images/ic_dirty_extreme_unselected.png"),
        Get.context!);
    precacheImage(const AssetImage("assets/images/player1.png"), Get.context!);
    precacheImage(const AssetImage("assets/images/player2.png"), Get.context!);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.toNamed(AppRoute.player);
      FlutterNativeSplash.remove();
    });
  }
}
