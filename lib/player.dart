import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:space_shooter/main.dart';

class Player extends SpriteAnimationComponent
    with HasGameReference<SpaceShooterGame> {
// load sprite animation
  @override
  Future<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
      'starfighter_2.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: .1,
        textureSize: Vector2(48, 48),
      ),
    );

    position = game.size / 2;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
