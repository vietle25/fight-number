import 'package:fight_number/styles/common_style.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/values/colors.dart';
import 'package:flutter/material.dart' hide Colors;

class TimekeepingButtonWidget extends StatefulWidget {
  final Function? onTap;

  const TimekeepingButtonWidget({
    key,
    this.onTap,
  });

  @override
  State<TimekeepingButtonWidget> createState() =>
      TimekeepingButtonWidgetState();
}

class TimekeepingButtonWidgetState extends State<TimekeepingButtonWidget>
    with TickerProviderStateMixin {
  late final AnimationController colorController;
  late Animation colorTween;
  late final AnimationController bounceController;
  double scale = 0.0;
  bool isTapped = false;
  bool animating = true;
  ButtonState state = ButtonState.init;

  @override
  void initState() {
    super.initState();
    colorController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    colorTween = ColorTween(begin: AppColors.primary, end: AppColors.green)
        .animate(colorController);
    bounceController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      lowerBound: 0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    isTapped = false;
  }

  @override
  void dispose() {
    colorController.dispose();
    bounceController.dispose();
    super.dispose();
  }

  void tapDown(TapDownDetails details) {
    bounceController.forward();
  }

  void tapUp(TapUpDetails details) {
    bounceController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    scale = 1 - bounceController.value;
    final bool isStretched = animating || state == ButtonState.init;
    final bool isDone = state == ButtonState.done;
    return Container(
      child: Transform.scale(
        scale: scale,
        child: Container(
          alignment: Alignment.center,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
            width: state == ButtonState.init ? Utils.getWidth() * 0.5 : 70,
            onEnd: () => setState(() => animating = !animating),
            height: 70,
            child: isStretched ? renderButtonContent() : renderLoading(isDone),
          ),
        ),
      ),
    );
  }

  Widget renderButtonContent() {
    return Material(
      color: AppColors.primary,
      // shape: const CircleBorder(),
      borderRadius: BorderRadius.circular(48),
      child: InkWell(
        borderRadius: BorderRadius.circular(48),
        onTapUp: tapUp,
        onTapDown: tapDown,
        onTap: () async {
          setState(() {
            state = ButtonState.loading;
          });
          await Future.delayed(const Duration(seconds: 2));
          colorController.forward();
          setState(() {
            state = ButtonState.done;
          });
          bounceController.forward();
          await Future.delayed(const Duration(milliseconds: 100));
          bounceController.reverse();
          await Future.delayed(const Duration(milliseconds: 500));
          colorController.reverse();
          setState(() {
            state = ButtonState.init;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 56,
            vertical: 22,
          ),
          alignment: Alignment.center,
          child: FittedBox(
            child: Text(
              "Vào làm",
              style: CommonStyle.textLargeBold(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget renderLoading(isDone) {
    return AnimatedBuilder(
      animation: colorTween,
      builder: (context, child) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorTween.value,
          // color: isDone ? Colors.green : Colors.primary,
        ),
        alignment: Alignment.center,
        child: isDone
            ? const Icon(
                Icons.check,
                size: 32,
                color: AppColors.white,
              )
            : const SizedBox(
                height: 34.0,
                width: 34.0,
                child: CircularProgressIndicator(
                  color: AppColors.white,
                ),
              ),
      ),
    );
  }
}

enum ButtonState { init, loading, done }
