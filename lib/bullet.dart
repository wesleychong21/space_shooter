import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'package:space_shooter/main.dart';

class Bullet extends SpriteAnimationComponent
    with HasGameReference<SpaceShooterGame> {
  Bullet(SpriteAnimationComponent parent)
      : super(
          size: Vector2(16, 16),
          anchor: Anchor.center,
          position: parent.position.clone(),
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    animation = await game.loadSpriteAnimation(
      'shot_1.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: .2,
        textureSize: Vector2(16, 16),
      ),
    );

    add(RectangleHitbox(
      collisionType: CollisionType.passive,
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += dt * -500;

// Remove the bullet if it goes off the screen

    if (position.y + 1000 < 0) {
      removeFromParent();
    }
  }
}
