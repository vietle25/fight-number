import 'package:angles/angles.dart';
import 'package:flutter/material.dart';
import 'package:fight_number/model/player_model.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/views/spin/wheel_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vector_math/vector_math.dart' show radians, Vector3;

class SpinWheel extends StatefulWidget {
  List<PlayerModel> players;
  Function onDone;
  Function onTapPlay;

  SpinWheel({
    super.key,
    required this.players,
    required this.onDone,
    required this.onTapPlay,
  });

  @override
  State<SpinWheel> createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> with TickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 2000),
    vsync: this,
  );

  late Animation<double> rotation;
  late Animation<double> translation;

  @override
  void initState() {
    super.initState();
    rotation = Tween<double>(
      begin: 0.0,
      end: 360.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      ),
    );
    translation = Tween<double>(
      begin: 0.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, widgets) {
          List<Widget> listPlayer = [];
          var degree = 360.0 / widget.players.length;
          for (int i = 0; i < widget.players.length; i++) {
            listPlayer.add(
              renderPlayer(
                i * degree,
                widget.players[i],
              ),
            );
          }
          return Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: radians(rotation.value),
                child: Stack(
                  alignment: Alignment.center,
                  children: listPlayer,
                ),
              ),
              WheelButton(
                onTap: () {
                  onTapPlay(degree);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget renderPlayer(double angle, PlayerModel player) {
    double playerAvatarWidth = Utils.userWidth();
    double distance =
        (Utils.buttonWheelWidth()) / 2 + playerAvatarWidth / 2 + 4.w;
    return Transform.translate(
      offset: Offset(
        distance * Angle.degrees(angle).sin,
        distance * Angle.degrees(angle).cos * -1,
      ),
      child: Transform.rotate(
        angle: radians(angle),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              player.avatar,
              width: playerAvatarWidth,
            ),
          ],
        ),
      ),
    );
  }

  void onTapPlay(double degree) {
    widget.onTapPlay();
    int randomPlayer = Utils.randomPlayer(widget.players.length);
    double randomDegree = (360 * 5) - (randomPlayer * degree);
    rotation = Tween<double>(
      begin: 0.0,
      end: randomDegree,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.elasticOut,
      ),
    );
    controller.forward(from: 0.0).whenComplete(() {
      widget.onDone(randomPlayer);
    });
  }
}
