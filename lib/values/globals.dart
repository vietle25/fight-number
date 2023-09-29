import 'package:get/get.dart';
import 'package:fight_number/locales/languages.dart';
import 'package:fight_number/model/category_model.dart';
import 'package:fight_number/model/language_model.dart';

class Globals {
  static Rx<CategoryModel> category = CategoryModel(
    name: 'cat_1',
    type: 'cat_1',
    logo: "assets/images/ic_dirty_extreme.png",
    unSelectedLogo: "assets/images/ic_dirty_extreme_unselected.png",
  ).obs;
  static LanguageModel language = Language.english;
}
