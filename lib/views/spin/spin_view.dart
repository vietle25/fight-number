import 'package:fight_number/controller/category_controller.dart';
import 'package:fight_number/controller/player_controller.dart';
import 'package:fight_number/controller/spin_controller.dart';
import 'package:fight_number/enums/enums.dart';
import 'package:fight_number/locales/localizes.dart';
import 'package:fight_number/model/category_model.dart';
import 'package:fight_number/router/app_route.dart';
import 'package:fight_number/styles/common_style.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/values/colors.dart';
import 'package:fight_number/values/images.dart';
import 'package:fight_number/views/base/base_view.dart';
import 'package:fight_number/views/spin/spin_wheel.dart';
import 'package:fight_number/widgets/pressable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SpinView extends BaseView {
  final SpinController _controller = Get.put(SpinController());

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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      renderHeader(),
                      // renderList(),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: Utils.widthWheel(),
                          width: Utils.widthWheel(),
                          alignment: Alignment.center,
                          child: renderSpinWheel(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget renderHeader() {
    return Container(
      margin: EdgeInsets.only(
        left: 4.w,
        right: 4.w,
        top: kToolbarHeight + 2.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "play".tr.toUpperCase(),
            maxLines: 1,
            style: CommonStyle.title(size: 32.sp),
            softWrap: true,
          ),
          renderButtonSetting(),
        ],
      ),
    );
  }

  Widget renderButtonSetting() {
    return PressableWidget(
      onTap: () {
        _controller.goTo(AppRoute.rules);
      },
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(
        left: 0,
      ),
      color: Colors.transparent,
      child: Image.asset(
        Images.icSetting,
        width: 10.w,
      ),
    );
  }

  Widget renderList() {
    final CategoryController categoryController =
        Get.find<CategoryController>();

    var list = [
      CategoryModel(
        name: Localizes.casual.tr,
        type: CategoryType.casual.name,
        logo: "assets/images/ic_casual.png",
        unSelectedLogo: "assets/images/ic_casual_unselected.png",
      ),
      CategoryModel(
        name: Localizes.dirty.tr,
        type: CategoryType.dirty.name,
        logo: "assets/images/ic_dirty.png",
        unSelectedLogo: "assets/images/ic_dirty_unselected.png",
      ),
      CategoryModel(
        name: Localizes.dirtyPlus.tr,
        type: CategoryType.dirtyPlus.name,
        logo: "assets/images/ic_dirty_plus.png",
        unSelectedLogo: "assets/images/ic_dirty_plus_unselected.png",
      ),
      CategoryModel(
        name: Localizes.dirtyExtreme.tr,
        type: CategoryType.dirtyExtreme.name,
        // type: CategoryType.dirtyPlus,
        logo: "assets/images/ic_dirty_extreme.png",
        unSelectedLogo: "assets/images/ic_dirty_extreme_unselected.png",
      ),
    ];
    // return Obx(() {
    List<Widget> categories = [];
    for (int i = 0; i < list.length; i++) {
      categories.add(renderItemCategory(list[i], i));
    }
    return Container(
      margin: EdgeInsets.only(top: 4.w),
      color: Colors.black54,
      padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categories,
      ),
    );
    // });
  }

  Widget renderItemCategory(CategoryModel category, int index) {
    double width = 11.w;
    if (isTablet()) {
      width = 9.w;
    }

    final CategoryController categoryController =
        Get.find<CategoryController>();
    return Obx(
      () => PressableWidget(
        color: Colors.transparent,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        onTap: () {
          categoryController.onSelect(category);
        },
        child: Column(
          children: [
            Image.asset(
              categoryController.selected.value.type == category.type
                  ? category.logo!
                  : category.unSelectedLogo!,
              width: width,
              height: width,
            ),
            Text(
              category.name!.toUpperCase(),
              style: CommonStyle.textSmall(size: 14.sp),
            )
          ],
        ),
      ),
    );
  }

  Widget renderSpinWheel() {
    final PlayerController playerController = Get.find<PlayerController>();
    return SpinWheel(
      players: playerController.players,
      onDone: (int index) {
        _controller.onSelectPlayer(index);
      },
      onTapPlay: _controller.onTapPlay,
    );
  }
}
