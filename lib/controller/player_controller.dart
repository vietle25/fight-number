import 'package:fight_number/controller/base_controller.dart';
import 'package:fight_number/model/player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class PlayerController extends BaseController {
  var players = [
    PlayerModel(
      name: "Player 1",
      color: const Color(0xFFE35555),
      avatar: 'assets/images/player1.png',
    ),
    PlayerModel(
      name: "Player 2",
      color: const Color(0xFFFFD75E),
      avatar: 'assets/images/player2.png',
    ),
  ].obs;
  late TextEditingController textCtrl;
  bool isFirstChange = true;
  ScrollController scrollController = ScrollController();

  var colors = [
    const Color(0xFFE35555),
    const Color(0xFFFFD75E),
    const Color(0xff79d347),
    const Color(0xff18af4e),
    const Color(0xff11babe),
    Colors.blue,
    const Color(0xffa748e7),
    const Color(0xffb569b7),
  ];

  @override
  void onInit() async {
    super.onInit();
    textCtrl = TextEditingController();
  }

  void addPlayer() {
    if (players.length < 4) {
      players.add(
        PlayerModel(
          name: 'Player ${players.length + 1}',
          color: colors[players.length],
          avatar: 'assets/images/player${players.length + 1}.png',
        ),
      );
    }
    Future.delayed(const Duration(milliseconds: 100), () {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 5,
          curve: Curves.bounceInOut,
          duration: const Duration(milliseconds: 200),
        );
      });
    });
  }

  onChangePlayerName(String value, int index) {
    players[index].name = value;
  }

  void removePlayer() {
    if (players.length > 2) {
      players.removeLast();
    }
  }
}
