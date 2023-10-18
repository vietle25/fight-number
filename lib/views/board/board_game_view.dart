import 'dart:isolate';
import 'dart:math';

import 'package:fight_number/controller/board_game_controller.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/values/colors.dart';
import 'package:fight_number/values/images.dart';
import 'package:fight_number/views/base/base_view.dart';
import 'package:fight_number/views/board/quarter_circle.dart';
import 'package:fight_number/views/spin/bouncing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BoardGameView extends BaseView {
  final BoardGameController _controller = Get.put(BoardGameController());

  @override
  PreferredSizeWidget? renderAppBar({required BuildContext context}) {
    return null;
  }

  @override
  Widget renderBody({required BuildContext context}) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.transparent));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Container(
        //   width: _controller.playerOne.width,
        //   height: _controller.playerOne.height,
        //   color: Colors.white70,
        // ),
        QuarterCircle(),
        Expanded(
          child: Center(
            child: Obx(() {
              return Stack(
                children: _controller.data
                    .map((e) => Positioned(
                          left: e.left,
                          top: e.top,
                          child: Transform.rotate(
                            angle: e.rotation,
                            child: Bouncing(
                              onPress: () {
                                // _controller.onTapNumber(e);
                              },
                              onMove: (PointerMoveEvent event) {
                                print(
                                    '${event.position.dx} - ${event.position.dy}');
                                _controller.onDrag(e,
                                    dx: event.position.dx,
                                    dy: event.position.dy);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                                padding: EdgeInsets.all(e.padding),
                                child: Text(
                                  '${e.value}',
                                  // You can generate your own numbers here
                                  style: TextStyle(
                                    fontSize: e.fontSize,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              );
            }),
          ),
        ),
      ],
    );

    return RandomNumbersScreen();
    final random = Random();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height - 12;

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
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
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

    return Stack(
      children: positionedNumbers,
    );
    return WillPopScope(
      onWillPop: () async => false,
      child: LayoutBuilder(
        builder: (context, constraint) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: Utils.getHeight(),
              maxHeight: Utils.getHeight(),
            ),
            child: IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.mainBg),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RandomNumbersScreen extends StatefulWidget {
  @override
  _RandomNumbersScreenState createState() => _RandomNumbersScreenState();
}

class _RandomNumbersScreenState extends State<RandomNumbersScreen> {
  final int numberOfNumbers = 1000; // You can change this number
  final double screenWidth;
  final double screenHeight;
  final ReceivePort _port = ReceivePort();
  final List<Rect> usedRectangles = [];
  List<Widget> items = [];
  Isolate? isolate;

  _RandomNumbersScreenState()
      : screenWidth =
            MediaQueryData.fromView(WidgetsBinding.instance!.window).size.width,
        screenHeight =
            MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;

  @override
  void initState() {
    super.initState();
    // _startIsolate();
  }

  void _startIsolate() async {
    // isolate = await Isolate.spawn(_generateNumbers, _port.sendPort);
    _port.listen((data) {
      if (data is List<Widget>) {
        setState(() {
          items = data;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    isolate?.kill();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: _generateNumbers(),
      ),
    );
  }

  _generateNumbers() {
    final List<Widget> items = [];
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

      do {
        fontSize =
            minFontSize + random.nextDouble() * (maxFontSize - minFontSize);
        padding = minPadding + random.nextDouble() * (maxPadding - minPadding);

        left = random.nextDouble() * (screenWidth - fontSize);
        top = random.nextDouble() * (screenHeight - fontSize);

        newRect = Rect.fromLTWH(
            left, top, fontSize + padding / 2, fontSize + padding / 2);
        collision = false;

        for (final rect in usedRectangles) {
          if (newRect.overlaps(rect)) {
            collision = true;
            break;
          }
        }
      } while (collision);

      usedRectangles.add(newRect);

      final Widget item = Positioned(
        left: left,
        top: top,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(0.5),
          ),
          padding: EdgeInsets.all(padding ?? 4),
          child: Text(
            '$i', // You can generate your own numbers here
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            ),
          ),
        ),
      );

      items.add(item);
    }
    return items;
    // sendPort.send(items);
  }
}

class RandomNumbersScreen1 extends StatelessWidget {
  final int numberOfNumbers = 100; // You can change this number
  final double screenWidth;
  final double screenHeight;
  final List<Rect> usedRectangles = [];

  RandomNumbersScreen1()
      : screenWidth =
            MediaQueryData.fromView(WidgetsBinding.instance!.window).size.width,
        screenHeight = MediaQueryData.fromView(WidgetsBinding.instance!.window)
            .size
            .height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: generateNumberItems(numberOfNumbers),
      ),
    );
  }

  bool isCollision(Rect newRect) {
    for (final rect in usedRectangles) {
      if (newRect.overlaps(rect)) {
        return true;
      }
    }
    return false;
  }

  List<Widget> generateNumberItems(int numberOfItems) {
    final List<Widget> items = [];

    final double minFontSize = 11.0;
    final double maxFontSize = 20.0;
    final double minPadding = 4.0;
    final double maxPadding = 10.0;

    final random = Random();

    for (int i = 0; i < numberOfItems; i++) {
      double left, top;
      Rect newRect;
      bool collision;

      do {
        final double fontSize =
            minFontSize + random.nextDouble() * (maxFontSize - minFontSize);
        final double padding =
            minPadding + random.nextDouble() * (maxPadding - minPadding);

        left = random.nextDouble() * (screenWidth - fontSize);
        top = random.nextDouble() * (screenHeight - fontSize);

        newRect = Rect.fromLTWH(left, top, fontSize, fontSize);
        collision = isCollision(newRect);
      } while (collision);

      usedRectangles.add(newRect);

      final Widget item = Positioned(
        left: left,
        top: top,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          padding: EdgeInsets.all(minPadding),
          child: Text(
            '$i', // You can generate your own numbers here
            style: TextStyle(
              fontSize: minFontSize,
              color: Colors.white,
            ),
          ),
        ),
      );

      items.add(item);
    }

    return items;
  }
}

class RandomNumbersScreen2 extends StatelessWidget {
  final int numberOfNumbers = 100; // You can change this number
  final double screenWidth;
  final double screenHeight;

  RandomNumbersScreen2()
      : screenWidth = MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
            .size
            .width,
        screenHeight =
            MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                .size
                .height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: generateNumberItems(numberOfNumbers),
      ),
    );
  }

  List<Widget> generateNumberItems(int numberOfItems) {
    final List<Widget> items = [];

    final double minFontSize = 11.0;
    final double maxFontSize = 19.0;
    final double minPadding = 4.0;
    final double maxPadding = 8.0;

    final random = Random();

    for (int i = 0; i < numberOfItems; i++) {
      final double fontSize =
          minFontSize + random.nextDouble() * (maxFontSize - minFontSize);
      final double padding =
          minPadding + random.nextDouble() * (maxPadding - minPadding);

      final double left = random.nextDouble() * (screenWidth - fontSize);
      final double top = random.nextDouble() * (screenHeight - fontSize);

      final Widget item = Positioned(
        left: left,
        top: top,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          padding: EdgeInsets.all(padding),
          child: Text(
            '$i', // You can generate your own numbers here
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            ),
          ),
        ),
      );

      items.add(item);
    }

    return items;
  }
}
