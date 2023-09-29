import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:fight_number/controller/base_controller.dart';
import 'package:fight_number/utils/storage_util.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/views/rules/disclaimer_dialog.dart';
import 'package:fight_number/views/rules/language_dialog.dart';
import 'package:fight_number/views/rules/notice_dialog.dart';

class RuleController extends BaseController {
  CollectionReference repo = FirebaseFirestore.instance.collection('tasks');

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
      // showDisclaimer();
      // showNotice();
    });
  }

  showDisclaimer() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return DisclaimerDialog();
      },
      barrierDismissible: false,
      barrierColor: const Color(0x67BDBDBD),
    );
  }

  showLanguageDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return LanguageDialog();
      },
      barrierDismissible: false,
      barrierColor: const Color(0x67BDBDBD),
    );
  }

  showNotice() async {
    var isNoticeShowed =
        await StorageUtil.retrieveItem(StorageUtil.noticeShowed);
    if (Utils.isNull(isNoticeShowed)) {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return NoticeDialog();
        },
        barrierDismissible: false,
        barrierColor: const Color(0x67BDBDBD),
      );
    }
  }
}
