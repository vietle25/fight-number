import 'dart:io';
import 'dart:math';

import 'package:fight_number/model/number_model.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

import 'base_controller.dart';

class BoardGameController extends BaseController {
  var number = 100.obs;
  List<Widget> positionedNumbers = [];
  var data = <NumberModel>[].obs;
  List<int> numbers = [];
  var playerOne = Rect.fromLTWH(Utils.getWidth() * 0.25, Utils.getHeight() - 50,
      Utils.getWidth() * 0.5, 50);

  @override
  onInit() {
    super.onInit();
    generateNumbers();
  }

  generateNumbers() {
    final double screenWidth =
        Utils.getWidth() - 10; // Replace with your desired screen width
    final double screenHeight =
        Utils.getHeight() - 10; // Replace with your desired screen height
    final List<Rect> usedRectangles = [];
    const int numberOfNumbers = 100; // You can change this number

    const double minFontSize = 11.0;
    const double maxFontSize = 20.0;
    const double minPadding = 4.0;
    const double maxPadding = 8.0;

    final random = Random();

    for (int i = 0; i < numberOfNumbers; i++) {
      double left, top;
      Rect newRect;
      bool collision;
      double fontSize;
      double padding;
      double rotation;
      int numberCollision = 0;

      do {
        fontSize =
            minFontSize + random.nextDouble() * (maxFontSize - minFontSize);
        padding = minPadding + random.nextDouble() * (maxPadding - minPadding);

        left = random.nextDouble() * (screenWidth - fontSize);
        top = random.nextDouble() * (screenHeight - fontSize);
        rotation = random.nextDouble() * 2 * pi;

        newRect = Rect.fromLTWH(
            left, top, fontSize + padding / 2, fontSize + padding / 2);
        collision = false;

        for (final rect in usedRectangles) {
          if (newRect.overlaps(rect)) {
            collision = true;
            numberCollision++;
            break;
          }
        }
        if (numberCollision > 30) {
          return;
        }
      } while (collision);

      usedRectangles.add(newRect);

      data.add(NumberModel(
          index: i,
          value: i + 1,
          fontSize: fontSize,
          padding: padding,
          rotation: rotation,
          left: left,
          top: top));
    }
  }

  onDrag(NumberModel item, {required double dx, required double dy}) {
    NumberModel e = item.copyWith(left: dx, top: dy);
    int index = data.indexWhere((e) => e.index == item.index);
    if (index != -1) {
      data[index] = e;
    }
  }

  onTapNumber(NumberModel item) async {
    if (data.first.value == item.value) {
      data.removeWhere((e) => e.index == item.index);
    } else {
      try {
        if (Platform.isIOS) {
          var _type = FeedbackType.medium;
          Vibrate.feedback(_type);
        } else {
          var a = await Vibration.hasVibrator();
          if (a ?? false) {
            Vibration.vibrate(duration: 50);
          }
        }
      } catch (e) {}
    }
  }

  generateList() {
    final random = Random();
    final screenWidth = Utils.getWidth();
    final screenHeight = Utils.getHeight() - 12;

    List<Widget> positionedNumbers = [];

    for (int i = 0; i < 100; i++) {
      double left, top;
      double size =
          11 + random.nextDouble() * 9.0; // Random size between 12 and 18

      // left = random.nextDouble() * (screenWidth - size);
      // top = random.nextDouble() * (screenHeight - size);

      // Keep generating positions until we find one that doesn't overlap with existing elements.
      do {
        left = random.nextDouble() * (screenWidth - size);
        top = random.nextDouble() * (screenHeight - size);
      } while (positionedNumbers.any((positioned) {
        double posX = (positioned as Positioned).left!;
        double posY = (positioned as Positioned).top!;
        // double itemSize = min(
        //     (positioned as Positioned).child!.constraints!.maxWidth,
        //     (positioned as Positioned).child!.constraints!.maxHeight);
        return (left - posX).abs() < size + 12 &&
            (top - posY).abs() < size + 12;
      }));
      final rotation = random.nextDouble() * 2 * pi;
      positionedNumbers.add(
        Positioned(
          left: left,
          top: top,
          child: Transform.rotate(
            angle: rotation,
            child: Container(
              // width: size,
              // height: size,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Center(
                child: Text(
                  '$i',
                  style:
                      TextStyle(fontSize: size.toDouble(), color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
