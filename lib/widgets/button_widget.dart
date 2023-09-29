import 'package:fight_number/styles/common_style.dart';
import 'package:fight_number/values/colors.dart';
import 'package:fight_number/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonWidget extends StatelessWidget {
  final Widget? child; // Child widget for custom inside
  final double? radius; // border radius of button
  final double? elevation;
  final Color? color; // Background color
  final String title; // Title of button
  final TextStyle? titleStyle; // Title style
  final VoidCallback? onTap; // On tap
  final EdgeInsets padding; // Padding
  final EdgeInsets? margin; // Margin
  final bool disable; // Disable button
  final MainAxisAlignment alignment;
  final BoxDecoration? decoration;

  const ButtonWidget({
    Key? key,
    this.child,
    this.radius = 22,
    this.color = const Color(0xff2B6883),
    this.titleStyle,
    this.decoration,
    this.disable = false,
    this.onTap,
    this.elevation,
    this.title = "",
    this.padding = const EdgeInsets.all(10),
    this.margin = const EdgeInsets.symmetric(
      horizontal: Constants.margin16,
      vertical: Constants.margin8,
    ),
    this.alignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(radius!),
          ),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(radius!),
        elevation: elevation ?? 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius!),
          onTap: disable ? null : onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 8.sp,
              ),
              borderRadius: BorderRadius.circular(radius!),
            ),
            alignment: Alignment.center,
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child ??
                    Text(
                      title.toString(),
                      style: titleStyle ??
                          CommonStyle.text(color: AppColors.white)
                              .merge(TextStyle(
                            height: 1.18,
                            fontSize: 24.sp,
                            fontStyle: FontStyle.italic,
                          )),
                      textScaleFactor: 1.0,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
