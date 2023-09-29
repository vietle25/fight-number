import 'package:fight_number/controller/category_controller.dart';
import 'package:fight_number/enums/enums.dart';
import 'package:fight_number/locales/localizes.dart';
import 'package:fight_number/model/category_model.dart';
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

class CategoryView extends BaseView {
  final CategoryController _controller = Get.find<CategoryController>();

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
                image: AssetImage(Images.bg),
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
                  visibleBack: true,
                ),
                Expanded(
                  child: renderList(),
                ),
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
            Localizes.category.tr.toUpperCase(),
            style: CommonStyle.title(size: 35.sp).merge(const TextStyle(
              height: 1.35,
            )),
            textScaleFactor: 1,
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
    // return Obx(() {
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
    return ListView.builder(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      padding: EdgeInsets.only(
        top: 5.w,
      ),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return renderItemCategory(list[index], index);
      },
      shrinkWrap: true,
    );
    // });
  }

  Widget renderItemCategory(CategoryModel category, int index) {
    return Obx(() => PressableWidget(
          margin: EdgeInsets.only(
            bottom: 4.w,
            left: 4.w,
            right: 4.w,
          ),
          radius: 2.w,
          color: _controller.selected.value.type == category.type
              ? AppColors.primary
              : AppColors.grey800,
          padding: EdgeInsets.symmetric(
            vertical: 4.w,
            horizontal: 4.w,
          ),
          onTap: () {
            _controller.onSelect(category);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  category.name!.toUpperCase(),
                  style: CommonStyle.title(size: 23.sp),
                  textScaleFactor: 1.0,
                ),
              ),
              Image.asset(
                category.logo!,
                width: isTablet() ? 10.w : 18.w,
                height: isTablet() ? 10.w : 18.w,
              ),
            ],
          ),
        ));
  }

  Widget renderButton() {
    return Obx(
      () => ButtonWidget(
        color: Utils.isNull(_controller.selected.value.name)
            ? AppColors.greyBlack
            : AppColors.primary,
        disable: Utils.isNull(_controller.selected.value.name),
        onTap: () {
          _controller.goTo(AppRoute.spin);
        },
        alignment: MainAxisAlignment.center,
        title: "done".tr.toUpperCase(),
        margin: EdgeInsets.symmetric(
          vertical: 5.w,
          horizontal: 4.w,
        ),
        // padding: EdgeInsets.symmetric(
        //   vertical: 3.w,
        //   horizontal: 4.w,
        // ),
      ),
    );
  }
}
