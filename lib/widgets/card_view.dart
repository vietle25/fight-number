import 'package:flutter/material.dart' hide Colors;
import 'package:fight_number/values/colors.dart';
import 'package:fight_number/values/constants.dart';

class CardView extends StatelessWidget {
  final Widget child; //child
  final Color? color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? borderRadius;

  const CardView({
    super.key,
    required this.child,
    this.color,
    this.margin,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
      ),
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
      margin: margin ??
          const EdgeInsets.only(
            left: Constants.margin16,
            right: Constants.margin16,
            top: Constants.margin16,
          ),
      child: child,
    );
  }
}
