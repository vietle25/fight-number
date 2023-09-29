import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fight_number/controller/base_controller.dart';
import 'package:fight_number/data/data_vi.dart';
import 'package:fight_number/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class ImportDataController extends BaseController {
  CollectionReference repo = FirebaseFirestore.instance.collection('tasks');
  var status = [
    "ahhahaha",
    '-----------------------------------------',
  ].obs;
  var dash = '---------------------------';

  @override
  void onInit() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
    super.onInit();
  }

  onCreateData() async {
    showLoading();
    status.insert(0, dash);
    status.insert(0, "----------START DATA TRUTH------------");
    status.insert(0, dash);
    status.insert(0, ' ');
    await onPushData(DataVI.truth, 'vi', 'truth');
    status.insert(0, ' ');
    status.insert(0, dash);
    status.insert(0, "----------DONE DATA DARE------------");
    status.insert(0, dash);
    status.insert(0, ' ');
    status.insert(0, ' ');
    status.insert(0, dash);
    status.insert(0, "----------START DATA DARE------------");
    status.insert(0, dash);
    status.insert(0, ' ');
    await onPushData(DataVI.dare, 'vi', 'dare');
    status.insert(0, ' ');
    status.insert(0, dash);
    status.insert(0, "----------DONE DATA DARE------------");
    status.insert(0, dash);
    status.insert(0, ' ');
    closeLoading();
  }

  onPushData(List<String> data, String lang, String type) async {
    int i = 0;
    while (i < data.length) {
      status.insert(0, '~~~> $i = ${data[i]} \n');
      TaskModel model;
      model = TaskModel(
        content: data[i],
        type: type,
        category: 'cat_1',
        lang: 'vi',
      );
      await FirebaseFirestore.instance
          .collection('cat_1')
          .doc(type)
          .collection('vi')
          .add(model.toJson());
      i++;
    }
  }
}
