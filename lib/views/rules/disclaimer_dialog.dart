import 'package:fight_number/locales/localizes.dart';
import 'package:fight_number/styles/common_style.dart';
import 'package:fight_number/values/constants.dart';
import 'package:fight_number/values/fonts.dart';
import 'package:fight_number/values/images.dart';
import 'package:fight_number/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DisclaimerDialog extends StatelessWidget {
  DisclaimerDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(9.w),
      insetAnimationCurve: Curves.easeIn,
      insetAnimationDuration: const Duration(milliseconds: 500),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "notice".tr.toUpperCase(),
                style: CommonStyle.textLarge(
                  size: 22.sp,
                ).merge(const TextStyle(
                  fontStyle: FontStyle.normal,
                )),
                textScaleFactor: 1.0,
              ),
              SizedBox(
                height: 3.w,
              ),
              Text(
                Localizes.disclaimerDes.tr,
                style: CommonStyle.text(
                  size: 17.sp,
                ).merge(
                  const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: Fonts.fontThin,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textScaleFactor: 1.0,
              ),
            ],
          ),
          ButtonWidget(
            titleStyle: CommonStyle.text().merge(
              TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20.sp,
                height: 1.2,
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 3.w,
            ),
            title: Localizes.ok.tr.toUpperCase(),
            onTap: onTapClose,
            margin: const EdgeInsets.only(
              top: Constants.margin48,
            ),
          ),
        ],
      ),
    );
  }

  /// On tap close
  onTapClose() {
    Navigator.of(Get.context!).pop();
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
