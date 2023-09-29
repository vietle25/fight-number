import 'package:fight_number/locales/localizes.dart';
import 'package:fight_number/styles/common_style.dart';
import 'package:fight_number/utils/storage_util.dart';
import 'package:fight_number/values/colors.dart';
import 'package:fight_number/values/constants.dart';
import 'package:fight_number/values/images.dart';
import 'package:fight_number/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NoticeDialog extends StatelessWidget {
  NoticeDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(9.w),
      insetAnimationCurve: Curves.easeIn,
      insetAnimationDuration: Duration(milliseconds: 500),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.cornerRadius),
      ),
      child: renderBody(),
    );
  }

  /// Render body
  Widget renderBody() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.bg),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(Constants.cornerRadius),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 5.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Localizes.importantNotice.tr.toUpperCase(),
            style: CommonStyle.title(
              size: 27.sp,
            ),
          ),
          SizedBox(
            height: 2.w,
          ),
          Text(
            Localizes.noticeDes.tr,
            style: CommonStyle.text(
              size: 19.sp,
            ).merge(
              const TextStyle(
                fontFamily: 'RakesMedium',
              ),
            ),
            textScaleFactor: 1.0,
          ),
          ButtonWidget(
            color: AppColors.buttonSecondary,
            titleStyle: CommonStyle.text(size: 20.sp).merge(
              const TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            title: Localizes.termsOfUse.tr.toUpperCase(),
            onTap: onTapTerm,
            margin: EdgeInsets.only(
              top: 5.w * 3,
            ),
          ),
          ButtonWidget(
            color: AppColors.buttonSecondary,
            titleStyle: CommonStyle.text(size: 20.sp).merge(
              const TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            title: Localizes.privacyPolicy.tr.toUpperCase(),
            onTap: onTapPrivacy,
            margin: EdgeInsets.only(
              top: 3.w,
            ),
          ),
          ButtonWidget(
            titleStyle: CommonStyle.text().merge(
              TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20.sp,
              ),
            ),
            title: Localizes.ok.tr.toUpperCase(),
            onTap: onTapClose,
            margin: EdgeInsets.only(
              top: 3.w,
            ),
          ),
        ],
      ),
    );
  }

  onTapTerm() {
    StorageUtil.storeItem(StorageUtil.noticeShowed, "showed");
  }

  onTapPrivacy() {
    StorageUtil.storeItem(StorageUtil.noticeShowed, "showed");
  }

  /// On tap close
  onTapClose() {
    StorageUtil.storeItem(StorageUtil.noticeShowed, "showed");
    Navigator.of(Get.context!).pop();
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
