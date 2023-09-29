import 'package:fight_number/controller/base_controller.dart';
import 'package:fight_number/enums/enums.dart';
import 'package:fight_number/locales/localizes.dart';
import 'package:fight_number/model/category_model.dart';
import 'package:fight_number/values/globals.dart';
import 'package:get/get.dart';

class CategoryController extends BaseController {
  var category = [].obs;
  var selected = CategoryModel().obs;

  @override
  void onInit() async {
    super.onInit();
    category.value = [
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
  }

  void onSelect(CategoryModel categoryModel) {
    selected.value = categoryModel;
    Globals.category.value = categoryModel;
  }
}
