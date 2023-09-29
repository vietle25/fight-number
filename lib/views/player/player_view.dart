import 'package:fight_number/controller/player_controller.dart';
import 'package:fight_number/locales/localizes.dart';
import 'package:fight_number/model/player_model.dart';
import 'package:fight_number/router/app_route.dart';
import 'package:fight_number/styles/common_style.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/values/colors.dart';
import 'package:fight_number/values/images.dart';
import 'package:fight_number/views/base/base_view.dart';
import 'package:fight_number/widgets/button_widget.dart';
import 'package:fight_number/widgets/header.dart';
import 'package:fight_number/widgets/pressable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlayerView extends BaseView {
  final PlayerController _controller = Get.find<PlayerController>();

  @override
  PreferredSizeWidget? renderAppBar({required BuildContext context}) {
    return null;
  }

  @override
  Widget renderBody({required BuildContext context}) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.transparent));
    return LayoutBuilder(
      builder: (context, constraint) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: Utils.getHeight(),
            maxHeight: Utils.getHeight(),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.mainBg),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Header(
                  title: Localizes.players.tr.toUpperCase(),
                  visibleBack: false,
                ),
                Expanded(child: renderList()),
                renderButton(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget renderHeader() {
    return Container(
      margin: EdgeInsets.only(
        left: 4.w,
        right: 4.w,
        top: 4.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          renderButtonBack(),
          Text(
            Localizes.players.tr.toUpperCase(),
            style: CommonStyle.title(size: 35.sp).merge(const TextStyle(
              height: 1.25,
            )),
          ),
        ],
      ),
    );
  }

  Widget renderButtonBack() {
    return PressableWidget(
      onTap: goBack,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(
        left: 0,
        bottom: 0,
      ),
      color: Colors.transparent,
      child: Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 29.sp,
      ),
    );
  }

  Widget renderList() {
    return Obx(
      () => ListView(
        shrinkWrap: true,
        controller: _controller.scrollController,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _controller.players.length,
            itemBuilder: (BuildContext context, int index) {
              return renderItemPlayer(_controller.players[index], index);
            },
          ),
          SizedBox(
            height: 3.w,
          ),
          renderButtonAction(),
        ],
      ),
    );
  }

  Widget renderItemPlayer(PlayerModel player, int index) {
    return PressableWidget(
      margin: EdgeInsets.only(
        bottom: 12,
        left: 4.w,
        right: 4.w,
      ),
      radius: 16,
      color: Colors.black54,
      padding: EdgeInsets.symmetric(
        vertical: 3.w,
        horizontal: 4.w,
      ),
      onTap: () async {
        _controller.isFirstChange = true;
        _controller.textCtrl.clear();
        await Get.bottomSheet(
          renderEditName(player, index),
          exitBottomSheetDuration: const Duration(milliseconds: 100),
          enableDrag: true,
        ).whenComplete(() {
          if (Utils.isNull(_controller.players[index].name)) {
            _controller.players[index].name = 'Player ${index + 1}';
          }
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  player.avatar,
                  width: 9.w,
                  height: 9.w,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                player.name,
                style: CommonStyle.text(size: 19.5.sp)
                    .merge(const TextStyle(height: 1)),
                maxLines: 1,
              )
            ],
          ),
          Icon(
            Icons.edit,
            color: Colors.white,
            size: 7.w,
          ),
        ],
      ),
    );
  }

  Widget renderButtonAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PressableWidget(
          radius: 8,
          onTap: _controller.addPlayer,
          margin: const EdgeInsets.only(right: 8, bottom: 24),
          padding: EdgeInsets.all(1.5.w),
          child: Image.asset(
            Images.icPlus,
            width: 7.5.w,
          ),
        ),
        PressableWidget(
          radius: 8,
          onTap: _controller.removePlayer,
          padding: EdgeInsets.all(1.5.w),
          margin: const EdgeInsets.only(left: 8, bottom: 24),
          child: Image.asset(
            Images.icMinus,
            width: 7.5.w,
          ),
        ),
      ],
    );
  }

  Widget renderButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "${"note".tr}: ${"playerNumberDes".tr}",
                  style: CommonStyle.textSmall().merge(const TextStyle(
                    fontStyle: FontStyle.italic,
                  )),
                ),
              ),
            ],
          ),
        ),
        ButtonWidget(
          onTap: () {
            // _controller.goTo(AppRoute.category);

            _controller.goTo(AppRoute.spin);
          },
          alignment: MainAxisAlignment.center,
          title: "continue".tr.toUpperCase(),
          margin: EdgeInsets.symmetric(
            vertical: 6.w,
            horizontal: 4.w,
          ),
        ),
      ],
    );
  }

  Widget renderEditName(PlayerModel model, int index) {
    if (model.name != 'Player ${index + 1}') {
      _controller.textCtrl.text = model.name;
    }
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 2.w,
        horizontal: 5.w,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: Utils.getWidth() - 120,
            child: TextField(
              controller: _controller.textCtrl,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                counter: null,
                counterText: "",
                hintText: model.name,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: index == 0
                      ? FontWeight.w400
                      : (index == 3 ? FontWeight.w500 : FontWeight.w800),
                ),
              ),
              textCapitalization: TextCapitalization.words,
              maxLength: 24,
              autofocus: true,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.greyBlack.withOpacity(0.8),
                  fontWeight: index == 0
                      ? FontWeight.w500
                      : (index == 3 ? FontWeight.w500 : FontWeight.w800),
                  decoration: TextDecoration.none,
                  decorationThickness: 0),
              onChanged: (value) {
                _controller.onChangePlayerName(value, index);
              },
            ),
          ),
          // PressableWidget(
          //   onTap: () {
          //     Navigator.pop(Get.overlayContext!);
          //   },
          //   color: Colors.transparent,
          //   margin: EdgeInsets.zero,
          //   child: Text(
          //     "ok".tr.toUpperCase(),
          //     style: TextStyle(color: Colors.black, fontSize: 15.sp),
          //   ),
          // ),

          renderButtonOK(),
        ],
      ),
    );
  }

  Widget renderButtonOK() {
    return PressableWidget(
      onTap: () {
        Navigator.pop(Get.overlayContext!);
      },
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      margin: EdgeInsets.zero,
      radius: 10,
      child: const Text(
        "OK",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }
}
