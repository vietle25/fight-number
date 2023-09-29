import 'package:fight_number/enums/enums.dart';
import 'package:fight_number/locales/localizes.dart';
import 'package:fight_number/model/task_model.dart';
import 'package:fight_number/styles/common_style.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/values/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardItem extends StatefulWidget {
  final TaskModel item;
  final VoidCallback onTap;
  final Color color;
  final int index;

  const CardItem({
    super.key,
    required this.item,
    required this.onTap,
    required this.color,
    required this.index,
  });

  @override
  State<CardItem> createState() => CardItemState();
}

class CardItemState extends State<CardItem> with TickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  );

  late AnimationController controller2 = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  );

  late Animation<double> rot;
  late Animation<double> trasl;

  bool isTap = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rot = Tween<double>(
      begin: -2,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInBack,
      ),
    );

    double widthItem =
        (Utils.getWidth() / Utils.getHeight()) > 0.7 ? 26.h : 50.w;

    double heightItem = widthItem * 1.35;
    if ((Utils.getWidth() / Utils.getHeight()) > 0.7) {
      heightItem = 33.h;
      widthItem = 50.w;
    } else if (heightItem > 33.h) {
      heightItem = 33.h;
      widthItem = 50.w;
    }

    double heightCard = heightItem - 7.w;
    double widthOnPhone = widthItem - 8.w - 8;
    double widthOnTablet = heightCard * (9 / 12);
    double widthCard =
        widthOnPhone > widthOnTablet ? widthOnTablet : widthOnPhone;

    final trasl = Tween<double>(
      begin: -250,
      end: (widget.index == 0 || widget.index == 2) ? (48.w - widthCard) : 2.w,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInBack,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => controller.forward());
    return Container(
      width: widthItem,
      height: heightItem,
      // color: Colors.blueGrey,
      // color: widget.index == 0
      //     ? Colors.black54
      //     : widget.index == 3
      //         ? Colors.green
      //         : Colors.yellowAccent,
      // padding: EdgeInsets.only(
      //     // left: (widget.index == 0 || widget.index == 2) ? 3.w : 2.w,
      //     // top: (widget.index == 0 || widget.index == 1) ? 5.w : 1.w,
      //     // right: (widget.index == 1 || widget.index == 3) ? 7.w : 2.w,
      //     ),
      child: AnimatedBuilder(
        animation: Listenable.merge([controller, controller2]),
        key: Key('item${widget.index}'),
        builder: (_, child) => Stack(
          children: [
            AnimatedPositioned(
              top: isTap
                  ? -100
                  : ((widget.index == 0 || widget.index == 1) ? 7.w : 4.w),
              left: isTap ? 500 : trasl.value,
              duration: Duration(milliseconds: isTap ? 500 : 10),
              child: Transform(
                transform: Matrix4.rotationZ(rot.value),
                alignment: Alignment.center,
                child: Container(
                  width: widthCard,
                  height: heightCard,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Images.cardBg),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: widget.color,
                      width: 4,
                    ),
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isTap = true;
                        });
                        Future.delayed(Duration(milliseconds: 200), () {
                          widget.onTap();
                        });
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.item.type == TaskType.truth.name
                                ? Localizes.truth.tr.toUpperCase()
                                : Localizes.dare.tr.toUpperCase(),
                            style: CommonStyle.text(
                              size: 16,
                              color: Colors.transparent,
                            ),
                            textScaleFactor: 1,
                          ),
                          Expanded(
                            child: SizedBox(
                              width: widget.item.type == TaskType.truth.name
                                  ? 50.w / 3
                                  : 50.w / 4,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Text(
                                  widget.item.type == TaskType.truth.name
                                      ? "?"
                                      : "!",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: widget.color,
                                    fontFamily: 'PathwayGothicOne-Regular',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.3,
                                    wordSpacing: 1,
                                    height: 1.4,
                                  ),
                                  textScaleFactor: 1,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(
                              right: 4,
                              bottom: 4,
                            ),
                            child: Text(
                              widget.item.type == TaskType.truth.name
                                  ? Localizes.truth.tr.toUpperCase()
                                  : Localizes.dare.tr.toUpperCase(),
                              style: CommonStyle.text(
                                size: 18.sp,
                                color: widget.color,
                                weight: FontWeight.w400,
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
            ),
          ],
        ),
      ),
    );
  }
}
//
// class CardItem extends StatelessWidget {
//   final TaskModel item;
//   final VoidCallback onTap;
//   final Color color;
//   final int index;
//
//   const CardItem({
//     super.key,
//     required this.item,
//     required this.onTap,
//     required this.color,
//     required this.index,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     double width = (Utils.getWidth() - 48) / 2;
//     double height = width * 1.5;
//     return Container(
//       margin: const EdgeInsets.all(8),
//       child: Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(Images.cardBg),
//             fit: BoxFit.cover,
//           ),
//           border: Border.all(
//             color: color,
//             width: 4,
//           ),
//           color: Colors.black54,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         alignment: Alignment.center,
//         child: Material(
//           color: Colors.transparent,
//           child: InkWell(
//             onTap: () {
//               onTap();
//             },
//             borderRadius: BorderRadius.circular(10),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   item.type == TaskType.truth.name
//                       ? Localizes.truth.tr.toUpperCase()
//                       : Localizes.dare.tr.toUpperCase(),
//                   style: CommonStyle.text(
//                     size: 16,
//                     color: Colors.transparent,
//                   ),
//                 ),
//                 Expanded(
//                   child: Text(
//                     item.type == TaskType.truth.name ? "?" : "!",
//                     style: CommonStyle.text(
//                       size: width,
//                     ).merge(TextStyle(
//                       fontFamily: Fonts.fontBold,
//                       color: color,
//                     )),
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.centerRight,
//                   padding: const EdgeInsets.only(
//                     right: 4,
//                     bottom: 4,
//                   ),
//                   child: Text(
//                     item.type == TaskType.truth.name
//                         ? Localizes.truth.tr.toUpperCase()
//                         : Localizes.dare.tr.toUpperCase(),
//                     style: CommonStyle.text(
//                       size: 18,
//                       color: color,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
