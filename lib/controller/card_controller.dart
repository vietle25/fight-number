import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:fight_number/controller/base_controller.dart';
import 'package:fight_number/enums/enums.dart';
import 'package:fight_number/model/category_model.dart';
import 'package:fight_number/model/task_model.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/values/globals.dart';

class CardController extends BaseController {
  var selected = CategoryModel().obs;
  var selectedCard = TaskModel().obs;
  var argument = Get.arguments;
  // var player = PlayerModel(
  //   name: "Player 2",
  //   color: Colors.yellowAccent,
  //   avatar: 'assets/images/player2.png',
  // ).obs;

  // final SpinController spinController = Get.find<SpinController>();
  var isShowCard = false.obs;
  var cards = [
    TaskModel(),
    TaskModel(),
    TaskModel(),
    TaskModel(),
  ].obs;

  @override
  void onInit() async {
    super.onInit();
    // player.value = spinController.player.value;
    // onRandomCard();
  }

  onTap() {
    var a = cards;
  }

  void onRandomCard() async {
    showLoading();
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
    }
    closeLoading();
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

  void getTasks(int truth, int dare) async {
    await getDocument('truth', truth);
    await getDocument('dare', dare);
  }

  void onPressCard(TaskModel selected) {
    isShowCard.value = true;
    selectedCard.value = selected;
  }

  void onPressContinue() {
    // isShowCard.value = false;
    selectedCard.value = TaskModel();
    goBack();
  }

  //
  // getDocument({required String type}) async {
  //   final autoId = Utils.getAutoId();
  //
  //   final query = FirebaseFirestore.instance
  //       .collection(Globals.category.value.type!.name)
  //   .doc(type)
  //       .collection(Globals.language.code)
  //       .where("qId", isGreaterThanOrEqualTo: autoId)
  //       .orderBy("qId")
  //       .limit(count);
  //   QuerySnapshot response = await query.getDocuments();
  //   if (response.documents == null || response.documents.length == 0) {
  //     final anotherQuery = ref
  //         .where('qId', isLessThan: autoId)
  //         .orderBy('qId')
  //         .limit(count);
  //     response = await anotherQuery.getDocuments();
  //   }
  // }

  getDocument(String type, int num) async {
    final query = FirebaseFirestore.instance
        .collection(Globals.category.value.type!)
        .doc(type)
        .collection(Globals.language.code);
    var key = query.doc().id;

    query
        .where(FieldPath.documentId, isGreaterThanOrEqualTo: key)
        .limit(num)
        .get()
        .then((snapshot) {
      if (snapshot.size > 0) {
        for (var doc in snapshot.docs) {
          print(doc.data().toString());
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
            print(doc.data().toString());
            cards.add(
              TaskModel(
                type: type == 'dare' ? TaskType.dare.name : TaskType.truth.name,
                content: doc.data()['content'],
              ),
            );
          }
        });
      }
    });
  }
}
