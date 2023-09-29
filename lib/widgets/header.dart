import 'package:fight_number/styles/common_style.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/widgets/pressable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Header extends StatelessWidget {
  final String title;
  final bool visibleBack;

  const Header({
    super.key,
    required this.title,
    this.visibleBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 4.w,
        right: 4.w,
        top: kToolbarHeight + 2.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          renderButtonBack(),
          Text(
            title,
            style: CommonStyle.title(size: 28.sp).merge(
              const TextStyle(
                height: 1.35,
              ),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            textScaleFactor: 1.0,
          ),
        ],
      ),
    );
  }

  Future goBack({BuildContext? context, result}) async {
    if (Get.isOverlaysOpen) Navigator.pop(Get.overlayContext!);
    if (!Utils.isNull(context)) {
      Navigator.pop(context!);
    } else {
      Get.back(result: result);
    }
  }

  Widget renderButtonBack() {
    return Visibility(
      visible: visibleBack,
      child: PressableWidget(
        onTap: goBack,
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.only(
          left: 0,
        ),
        color: Colors.transparent,
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 12.w,
        ),
      ),
    );
  }
}
