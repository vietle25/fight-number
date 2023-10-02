import 'package:fight_number/views/board/board_game_view.dart';
import 'package:fight_number/views/card/card_view.dart';
import 'package:fight_number/views/category/category_view.dart';
import 'package:fight_number/views/data/data_screen.dart';
import 'package:fight_number/views/player/player_view.dart';
import 'package:fight_number/views/rules/rules_view.dart';
import 'package:fight_number/views/spin/spin_view.dart';
import 'package:fight_number/views/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const splash = '/splash';
  static const rules = '/rules';
  static const player = '/player';
  static const category = '/category';
  static const spin = '/spin';
  static const card = '/card';
  static const data = '/data';
  static const board = '/board';

  static final route = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 800),
      opaque: true,
    ),
    GetPage(
      name: data,
      page: () => DataScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 800),
      opaque: true,
    ),
    GetPage(
      name: rules,
      page: () => RulesView(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 800),
      opaque: true,
    ),
    GetPage(
      name: player,
      page: () => PlayerView(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 800),
      opaque: true,
    ),
    GetPage(
      name: category,
      page: () => CategoryView(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 800),
      opaque: true,
    ),
    GetPage(
      name: spin,
      page: () => SpinView(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 800),
      opaque: true,
    ),
    GetPage(
      name: card,
      page: () => CardView(),
      transition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 100),
      opaque: true,
    ),
    GetPage(
      name: board,
      page: () => BoardGameView(),
      transition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 100),
      opaque: true,
    ),
  ];
}
