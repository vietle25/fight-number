import 'package:fight_number/controller/purchase_controller.dart';
import 'package:fight_number/controller/rule_controller.dart';
import 'package:fight_number/locales/localizes.dart';
import 'package:fight_number/styles/common_style.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/values/colors.dart';
import 'package:fight_number/values/fonts.dart';
import 'package:fight_number/values/globals.dart';
import 'package:fight_number/values/images.dart';
import 'package:fight_number/views/base/base_view.dart';
import 'package:fight_number/widgets/button_widget.dart';
import 'package:fight_number/widgets/pressable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RulesView extends BaseView {
  final RuleController _controller = Get.put(RuleController());

  @override
  PreferredSizeWidget? renderAppBar({required BuildContext context}) {
    return null;
  }

  @override
  Widget renderBody({required BuildContext context}) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
    ));
    return LayoutBuilder(builder: (context, constraint) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: Utils.getHeight(),
          maxHeight: Utils.getHeight(),
        ),
        child: IntrinsicHeight(
          child: Container(
            // padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.mainBg),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                renderHeader(),
                renderRules(),
                // renderLogo(),
                renderButton(),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget renderHeader() {
    return Container(
      margin: EdgeInsets.only(
        left: 4.w,
        right: 4.w,
        top: kToolbarHeight + 2.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              Localizes.rules.tr.toUpperCase(),
              maxLines: 1,
              style: CommonStyle.title(size: 28.sp),
              softWrap: true,
            ),
          ),
          // renderButtonLang(),
        ],
      ),
    );
  }

  Widget renderButtonLang() {
    return PressableWidget(
      onTap: _controller.showLanguageDialog,
      radius: 100,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Image.asset(
          Globals.language.flag,
          width: 12.w,
          height: 12.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget renderRules() {
    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(
          vertical: 2.w,
          horizontal: 4.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Localizes.rule1.tr,
              style: CommonStyle.text(
                size: 20.sp,
                weight: FontWeight.w400,
              ),
              textScaleFactor: 1.0,
            ),
            SizedBox(
              height: 4.w,
            ),
            Text(
              Localizes.rule2.tr,
              style: CommonStyle.text(
                size: 20.sp,
                weight: FontWeight.w400,
              ),
              textScaleFactor: 1.0,
            ),
            SizedBox(
              height: 4.w,
            ),
            Text(
              Localizes.rule3.tr,
              style: CommonStyle.text(
                size: 20.sp,
                weight: FontWeight.w400,
              ),
              textScaleFactor: 1.0,
            ),
            SizedBox(
              height: 4.w,
            ),
            Text(
              Localizes.rule4.tr,
              style: CommonStyle.text(
                size: 20.sp,
                weight: FontWeight.w400,
              ),
              textScaleFactor: 1.0,
            ),
            SizedBox(
              height: 4.w,
            ),
            Text(
              "rule5".tr,
              style: CommonStyle.text(
                size: 20.sp,
                weight: FontWeight.w400,
              ),
              textScaleFactor: 1.0,
            ),
            SizedBox(
              height: 6.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${"notice".tr}:   ",
                        style: CommonStyle.textLarge(
                          size: 18.sp,
                        ).merge(const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        )),
                      ),
                      TextSpan(
                        text: Localizes.disclaimerDes.tr,
                        style: CommonStyle.text(
                          size: 15.sp,
                        ).merge(
                          const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontFamily: Fonts.fontThin,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  textScaleFactor: 1.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget renderLogo() {
    return Image.asset(
      Images.appLogoRounded,
      width: Utils.getWidth() * 0.3,
    );
  }

  Widget renderButton() {
    final PurchaseController purchaseController =
        Get.find<PurchaseController>();
    return ButtonWidget(
      onTap: () {
        // _controller.goTo(AppRoute.player);
        purchaseController.loadPurchases();
        // _controller.showDisclaimer();
      },
      alignment: MainAxisAlignment.center,
      title: "continue".tr.toUpperCase(),
      margin: EdgeInsets.only(
        bottom: 6.w,
        left: 5.w,
        right: 5.w,
        top: 3.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 3.w,
        horizontal: 4.w,
      ),
    );
  }
}
