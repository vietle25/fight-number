import 'package:fight_number/controller/common_mixin.dart';
import 'package:fight_number/styles/common_style.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/values/colors.dart';
import 'package:fight_number/values/constants.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:get/get.dart';

import 'button_widget.dart';

class BottomSheetWidget extends StatelessWidget with ItemMixin {
  final String? title; // Title text
  final String? subTitle; // Title text
  final TextStyle? titleStyle; // Title style
  final bool showIconClose; // Show icon close
  final bool expandChild; // Show icon close
  final Widget? child; // Child
  final double? height;
  final bool? iconCloseRight;
  final Function? onDismiss;

  BottomSheetWidget({
    super.key,
    this.title,
    this.subTitle,
    this.titleStyle,
    this.showIconClose = false,
    this.expandChild = false,
    this.child,
    this.height,
    this.onDismiss,
    this.iconCloseRight = true,
  });

  @override
  Widget build(BuildContext context) {
    return renderBody(context);
  }

  /// Render body
  Widget renderBody(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Constants.cornerRadius),
            topRight: Radius.circular(Constants.cornerRadius),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            (Utils.isNull(title) && !showIconClose)
                ? Container()
                : Container(
                    padding: const EdgeInsets.all(Constants.padding16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        (!(iconCloseRight ?? false))
                            ? renderCloseButton()
                            : Container(),
                        Utils.isNull(title)
                            ? Container()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    title ?? "Notification",
                                    style: titleStyle ??
                                        CommonStyle.textMediumBold(),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: Constants.margin,
                                  ),
                                  Utils.isNull(subTitle)
                                      ? Container()
                                      : Text(
                                          subTitle!,
                                          style: CommonStyle.textSmall(
                                              color: AppColors.grey400),
                                          textAlign: TextAlign.center,
                                        ),
                                ],
                              ),
                        ((iconCloseRight ?? false))
                            ? renderCloseButton()
                            : Container(),
                      ],
                    ),
                  ),
            if (expandChild) Expanded(child: child ?? Container()),
            if (!expandChild) child ?? Container()
          ],
        ),
      ),
    );
  }

  // Returns the close button on the top right
  Widget renderCloseButton() {
    return showIconClose
        ? ButtonWidget(
            margin: EdgeInsets.zero,
            color: AppColors.transparent,
            onTap: onTapClose,
            padding: EdgeInsets.zero,
            child: const Icon(Icons.close),
          )
        : Container();
  }

  /// On tap close
  onTapClose() {
    Navigator.of(Get.context!, rootNavigator: true).pop();
    if (onDismiss != null) {
      onDismiss!();
    }
  }
}
