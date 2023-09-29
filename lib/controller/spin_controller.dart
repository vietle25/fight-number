import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:fight_number/controller/base_controller.dart';
import 'package:fight_number/controller/player_controller.dart';
import 'package:fight_number/enums/enums.dart';
import 'package:fight_number/model/player_model.dart';
import 'package:fight_number/model/task_model.dart';
import 'package:fight_number/router/app_route.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/values/globals.dart';

class SpinController extends BaseController {
  var player = PlayerModel(name: '', avatar: '', color: Color(0xff000000)).obs;
  StreamController<int> streamController = StreamController<int>();

  final PlayerController playerController = Get.find<PlayerController>();
  bool doneAnimation = false;
  bool doneData = false;

  var cards = [
    TaskModel(),
    TaskModel(),
    TaskModel(),
    TaskModel(),
  ].obs;

  @override
  void onInit() async {
    super.onInit();

    onRandomCard();
  }

  void onSelectPlayer(int index) {
    final PlayerController playerController = Get.find<PlayerController>();
    player.value = playerController.players[index];
    doneAnimation = true;
    if (doneAnimation && doneData) {
      doneAnimation = false;
      doneData = false;
      goTo(
        AppRoute.card,
      );
    }
  }

  void onTapPlay() {
    doneAnimation = false;
    doneData = false;
    onRandomCard();
  }

  void onRandomCard() async {
    // showLoading();
    int truth = 0;
    int dare = 0;
    cards.clear();
    int i = 0;
    while (i < 4) {
      int random = getRandomBit(truth, dare);
      if (random == 1) {
        truth += 1;
      } else {
        dare += 1;
      }
      await getDocument(
          random == 0 ? TaskType.dare.name : TaskType.truth.name, 1);
      i++;
      if (i == 4) {
        doneData = true;
        if (doneAnimation && doneData) {
          doneAnimation = false;
          doneData = false;
          goTo(
            AppRoute.card,
          );
        }
      }
    }
    // closeLoading();
  }

  int getRandomBit(int truth, int dare) {
    if (truth == 3) {
      return 0;
    } else if (dare == 3) {
      return 1;
    } else {
      return Utils.random(0, 2);
    }
  }

  getDocument(String type, int num) async {
    String categoryName =
        Globals.category.value.type == CategoryType.dirtyExtreme
            ? CategoryType.dirtyPlus.name
            : Globals.category.value.type!;
    final query = FirebaseFirestore.instance
        .collection(categoryName)
        .doc(type)
        .collection(Globals.language.code);
    var key = query.doc().id;

    var snapshot = await query
        .where(FieldPath.documentId, isGreaterThanOrEqualTo: key)
        .limit(num)
        .get();
    if (snapshot.size > 0) {
      for (var doc in snapshot.docs) {
        cards.add(
          TaskModel(
            type: type == 'dare' ? TaskType.dare.name : TaskType.truth.name,
            content: doc.data()['content'],
          ),
        );
      }
    } else {
      query
          .where(FieldPath.documentId, isLessThan: key)
          .limit(num)
          .get()
          .then((snapshot) {
        for (var doc in snapshot.docs) {
          cards.add(
            TaskModel(
              type: type == 'dare' ? TaskType.dare.name : TaskType.truth.name,
              content: doc.data()['content'],
            ),
          );
        }
      });
    }
  }
}
