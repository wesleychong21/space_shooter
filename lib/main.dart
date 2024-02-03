import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:space_shooter/player.dart';

class SpaceShooterGame extends FlameGame with PanDetector {
  late Player player;
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    player = Player()
      ..position = size / 2
      ..width = 48
      ..height = 48
      ..anchor = Anchor.center;

    add(player);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.global);
  }
}

void main() {
  final game = SpaceShooterGame();
  runApp(GameWidget(game: game));
}
