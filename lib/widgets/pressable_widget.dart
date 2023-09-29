import 'package:flutter/material.dart' hide Colors;
import 'package:fight_number/values/colors.dart';
import 'package:fight_number/values/constants.dart';

class PressableWidget extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool disable;
  final bool shadow;
  final BoxDecoration? decoration;

  const PressableWidget({
    Key? key,
    required this.child,
    this.radius = 4,
    this.color = AppColors.white,
    this.decoration,
    this.disable = false,
    this.shadow = false,
    this.onTap,
    this.padding = const EdgeInsets.all(Constants.padding16),
    this.margin = const EdgeInsets.symmetric(
      horizontal: Constants.margin16,
      vertical: Constants.margin8,
    ),
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
        elevation: shadow ? 8 : 0,
        borderRadius: BorderRadius.circular(radius!),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius!),
          onTap: disable ? null : onTap,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(Constants.padding16),
            child: child,
          ),
        ),
      ),
    );
  }
}
