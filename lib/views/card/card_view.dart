import 'package:fight_number/controller/card_controller.dart';
import 'package:fight_number/controller/spin_controller.dart';
import 'package:fight_number/router/app_route.dart';
import 'package:fight_number/styles/common_style.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/values/colors.dart';
import 'package:fight_number/values/images.dart';
import 'package:fight_number/views/base/base_view.dart';
import 'package:fight_number/views/card/card_dialog.dart';
import 'package:fight_number/views/card/card_item.dart';
import 'package:fight_number/widgets/pressable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardView extends BaseView {
  final CardController _controller = Get.put(CardController());

  @override
  PreferredSizeWidget? renderAppBar({required BuildContext context}) {
    return null;
  }

  @override
  Widget renderBody({required BuildContext context}) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.transparent));
    return WillPopScope(
      onWillPop: () async => false,
      child: LayoutBuilder(
        builder: (context, constraint) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: Utils.getHeight(),
              maxHeight: Utils.getHeight(),
            ),
            child: IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.mainBg),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    renderHeader(),
                    Flexible(
                      child: renderContent(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget renderHeader() {
    final SpinController spinController = Get.find<SpinController>();
    return Container(
      margin: EdgeInsets.only(
        left: 4.5.w,
        right: 4.5.w,
        top: kToolbarHeight,
        bottom: 4.w,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              spinController.player.value.name.toUpperCase(),
              style: CommonStyle.title(
                size: 30.sp,
                color: spinController.player.value.color,
              ).merge(const TextStyle(height: 1.1)),
              textScaleFactor: 1,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget renderButtonSetting() {
    return PressableWidget(
      onTap: () {
        _controller.goToAndRemove(AppRoute.rules);
      },
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(
        left: 0,
        top: 0,
      ),
      color: Colors.transparent,
      child: Image.asset(
        Images.icSetting,
        width: 10.w,
      ),
    );
  }

  Widget renderContent() {
    final SpinController spinController = Get.find<SpinController>();
    return Stack(
      alignment: Alignment.center,
      children: [
        renderCard(),
        Obx(() {
          if (_controller.isShowCard.value) {
            return CardDialog(
              task: _controller.selectedCard.value,
              color: spinController.player.value.color,
              onTap: _controller.onPressContinue,
            );
          }
          return const Offstage();
        }),
      ],
    );
  }

  Widget renderCard() {
    return Container(
      alignment: Alignment.center,
      child: Obx(() {
        final SpinController spinController = Get.find<SpinController>();
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardItem(
                  item: spinController.cards[0],
                  onTap: () {
                    _controller.onPressCard(spinController.cards[0]);
                  },
                  color: spinController.player.value.color,
                  index: 0,
                ),
                CardItem(
                  item: spinController.cards[1],
                  onTap: () {
                    _controller.onPressCard(spinController.cards[1]);
                  },
                  color: spinController.player.value.color,
                  index: 1,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardItem(
                  item: spinController.cards[2],
                  onTap: () {
                    _controller.onPressCard(spinController.cards[2]);
                  },
                  color: spinController.player.value.color,
                  index: 2,
                ),
                CardItem(
                  item: spinController.cards[3],
                  onTap: () {
                    _controller.onPressCard(spinController.cards[3]);
                  },
                  color: spinController.player.value.color,
                  index: 3,
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
