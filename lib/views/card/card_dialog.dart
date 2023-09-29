import 'package:fight_number/enums/enums.dart';
import 'package:fight_number/locales/localizes.dart';
import 'package:fight_number/model/task_model.dart';
import 'package:fight_number/styles/common_style.dart';
import 'package:fight_number/values/constants.dart';
import 'package:fight_number/widgets/pressable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

class CardDialog extends StatefulWidget {
  final TaskModel task;
  final Color color;
  final VoidCallback onTap;

  const CardDialog({
    super.key,
    required this.task,
    required this.color,
    required this.onTap,
  });

  @override
  State<CardDialog> createState() => CardDialogState();
}

class CardDialogState extends State<CardDialog> with TickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final rot = Tween<double>(
      begin: 1,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    double heightItem = 66.h;
    double widthItem =
        (heightItem * (9 / 12)) > 90.w ? 90.w : (heightItem * (9 / 12));

    final right = Tween<double>(
      begin: -600,
      end: (100.w - widthItem) / 2,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => controller.forward());
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) => Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: right.value,
            child: Transform(
              transform: Matrix4.rotationZ(rot.value),
              alignment: Alignment.center,
              child: PressableWidget(
                color: widget.color,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                onTap: widget.onTap,
                child: Container(
                  height: heightItem,
                  width: widthItem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Constants.cornerRadius),
                    color: widget.color,
                    boxShadow: [
                      BoxShadow(
                        color: widget.color.withOpacity(0.4),
                        offset: const Offset(0, 0),
                        blurRadius: 15,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      renderTitle(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: renderContent(),
                      ),
                      Transform.rotate(
                        angle: radians(180),
                        child: renderTitle(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderContent() {
    return Column(
      children: [
        Text(
          widget.task.content ?? '',
          style: CommonStyle.textSmall(color: Colors.black, size: 19.sp)
              .merge(const TextStyle(
            fontWeight: FontWeight.w500,
          )),
          textAlign: TextAlign.center,
          textScaleFactor: 1,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "(${Localizes.clickToContinue.tr})",
          style: CommonStyle.textSmall(color: Colors.black87, size: 16.sp)
              .merge(const TextStyle(
            fontWeight: FontWeight.w500,
          )),
          textScaleFactor: 1,
        )
      ],
    );
  }

  Widget renderTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 3.w),
          child: Text(
            widget.task.type == TaskType.truth.name ? "?".toUpperCase() : "!",
            style: CommonStyle.text(color: Colors.black, size: 28.sp)
                .merge(const TextStyle(
              fontFamily: 'PathwayGothicOne-Regular',
              fontWeight: FontWeight.w900,
              height: 1,
            )),
            textScaleFactor: 1,
          ),
        ),
        Text(
          widget.task.type == TaskType.truth.name
              ? Localizes.truth.tr.toUpperCase()
              : Localizes.dare.tr.toUpperCase()
            ..toUpperCase(),
          style: CommonStyle.text(color: Colors.black, size: 23.sp)
              .merge(const TextStyle(
            fontStyle: FontStyle.italic,
          )),
          textScaleFactor: 1,
        ),
      ],
    );
  }
}
