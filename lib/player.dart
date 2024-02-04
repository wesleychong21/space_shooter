import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:space_shooter/main.dart';
import 'package:space_shooter/bullet.dart';

class Player extends SpriteAnimationComponent
    with HasGameReference<SpaceShooterGame> {
  late final SpawnComponent _bulletSpawner;

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
    size = Vector2(48, 48);
    anchor = Anchor.center;

    _bulletSpawner = SpawnComponent(
      period: .2,
      selfPositioning: true,
      factory: (index) {
        return Bullet(
          this,
        );

        //return bullet;
      },
      autoStart: false,
    );

    add(_bulletSpawner);
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  void startShooting() {
    // TODO
    _bulletSpawner.timer.start();
  }

  void stopShooting() {
    // TODO
    _bulletSpawner.timer.stop();
  }
}
