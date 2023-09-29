import 'dart:async';

import 'package:fight_number/model/language_model.dart';
import 'package:fight_number/utils/storage_util.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/values/constants.dart';
import 'package:fight_number/values/globals.dart';
import 'package:fight_number/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  /// Navigate to new screen with name.
  Future goTo(String router, [dynamic params]) async {
    navigatorPopOverlay();
    await Get.toNamed(router, arguments: params);
  }

  /// Navigate and remove the previous screen from the tree.
  Future goToAndRemove(String router, [dynamic params]) async =>
      await Get.offNamed(router, arguments: params);

  /// Navigate and remove all previous screens from the tree.
  Future goToAndRemoveAll(String router, [dynamic params]) async =>
      await Get.offAllNamed(router, arguments: params);

  /// Go back
  Future goBack({BuildContext? context, result}) async {
    navigatorPopOverlay();
    if (!Utils.isNull(context)) {
      Navigator.pop(context!);
    } else {
      Get.back(result: result);
    }
  }

  /// Handle back
  Future<bool> handleBack() async {
    if (EasyLoading.isShow) {
      closeLoading();
    }
    return true;
  }

  /// Show dialog loading
  void showLoading() => EasyLoading.show();

  /// Close dialog loading
  void closeLoading() => EasyLoading.dismiss();

  /// Show bottom sheet
  Future showBottomSheet({
    String? title,
    required Widget child,
    double? height,
    bool showIconClose = false,
    String? subTitle,
    bool? iconCloseRight,
    bool? expandChild,
    Function? onDismiss,
    bool isScrollControlled = true,
  }) async {
    await Get.bottomSheet(
      BottomSheetWidget(
        height: height,
        title: title,
        subTitle: subTitle,
        iconCloseRight: iconCloseRight,
        expandChild: false,
        onDismiss: onDismiss,
        showIconClose: showIconClose,
        child: child,
      ),
      isScrollControlled: isScrollControlled,
    );
  }

  /// Close snack bars, dialogs, bottom sheets, or anything you would normally
  void navigatorPopOverlay() {
    if (Get.isOverlaysOpen) Navigator.pop(Get.overlayContext!);
  }

  /// Show message
  showMessage({String? title, String? message}) {
    Get.snackbar(
      title ?? 'Notification',
      message!,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(Constants.margin16),
      backgroundColor: Theme.of(Get.context!).bottomAppBarTheme.color,
      colorText: Theme.of(Get.context!).textTheme.bodyMedium?.color,
    );
  }

  /// Close keyboard
  void closeKeyboard() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  /// Update language app
  void updateLanguage(LanguageModel language) async {
    Globals.language = language;
    await StorageUtil.storeItem(StorageUtil.language, language);
    List<String> values = Globals.language.localesCode.split('_');
    if (values.length > 1) {
      Get.updateLocale(Locale(values[0], values[1]));
    }
  }
}
