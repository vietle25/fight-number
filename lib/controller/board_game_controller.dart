import 'dart:math';

import 'package:fight_number/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

class BoardGameController extends BaseController {
  var number = 100.obs;
  List<Widget> positionedNumbers = [];

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
