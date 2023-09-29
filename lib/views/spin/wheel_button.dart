import 'package:fight_number/locales/localizes.dart';
import 'package:fight_number/styles/common_style.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/values/constants.dart';
import 'package:fight_number/values/images.dart';
import 'package:fight_number/views/spin/bouncing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WheelButton extends StatefulWidget {
  Function onTap;

  WheelButton({
    super.key,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    return WheelButtonState();
  }
}

class WheelButtonState extends State<WheelButton>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isAnimate = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 1000,
        ));
  }

  @override
  Widget build(BuildContext context) {
    double width = Utils.buttonWheelWidth();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width),
      ),
      child: Bouncing(
        onPress: () => widget.onTap(),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(width),
          child: InkWell(
            borderRadius: BorderRadius.circular(width),
            onTap: () async {
              widget.onTap();
            },
            child: Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width),
              ),
              padding: const EdgeInsets.all(Constants.padding8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.cat,
                    color: const Color(0xff252525),
                    width: width / 2.5,
                    height: width / 2.5,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    alignment: Alignment.topCenter,
                    child: Text(
                      Localizes.clickHere.tr.toUpperCase(),
                      style: CommonStyle.textSmall(
                        size: 15.sp,
                        color: Colors.black,
                      ),
                      textScaleFactor: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
