import 'package:fight_number/controller/base_controller.dart';
import 'package:fight_number/styles/extend_theme.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BaseView extends StatelessWidget {
  final BaseController _baseController = Get.put(BaseController());

  BaseView({Key? key}) : super(key: key);

  Future<bool> onWillPop() async {
    return _baseController.handleBack();
  }

  Future goBack({BuildContext? context}) async {
    _baseController.goBack(context: context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack,
        overlays: [SystemUiOverlay.top]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? child) {
        final mediaQueryData = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQueryData.copyWith(textScaleFactor: 1.0),
          child: WillPopScope(
            onWillPop: onWillPop,
            child: Scaffold(
              backgroundColor: const Color(0xff263D47),
              appBar: renderAppBar(context: context),
              body: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: renderBody(context: context),
              ),
              resizeToAvoidBottomInset: false,
              floatingActionButton: renderFloatingButton(context: context),
            ),
          ),
        );
      },
    );
  }

  Widget? renderFloatingButton({required BuildContext context}) {
    return null;
  }

  PreferredSizeWidget? renderAppBar({required BuildContext context}) {
    return null;
  }

  Widget? renderBody({required BuildContext context}) {
    return null;
  }

  ThemeData getTheme(BuildContext context) => Theme.of(context);

  ExtendTheme getExtTheme(BuildContext context) =>
      Theme.of(context).extension<ExtendTheme>()!;

  void navigatorPopOverlay() {
    if (Get.isOverlaysOpen) Navigator.pop(Get.overlayContext!);
  }

  bool isTablet() {
// The equivalent of the "smallestWidth" qualifier on Android.
    var shortestSide = MediaQuery.of(Get.context!).size.shortestSide;

// Determine if we should use mobile layout or not, 600 here is
// a common breakpoint for a typical 7-inch tablet.
    return shortestSide > 600;
  }
}
