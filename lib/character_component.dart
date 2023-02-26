import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';

enum CharacterDirection { left, right }

enum CharacterStartLocation { left, right }

class CharacterComponent extends SpriteComponent with HasGameRef {
  List<Sprite> sprites;

  double leftBorder = 0.0;
  late double rightBorder;
  final CharacterStartLocation startLocation;
  late CharacterDirection direction;
  bool move = false;
  late Timer interval;
  final randomNumberGenerator = Random();

  CharacterComponent({required this.sprites, required this.startLocation})
      : super(anchor: Anchor.topCenter);

  @override
  FutureOr<void> onLoad() {
    double moveIntervalTime = randomNumberGenerator.nextDouble() * 5 + 5;
    interval = Timer(moveIntervalTime, onTick: () {
      move = !move;
    }, repeat: true);
    sprite = sprites[0];
    if (startLocation == CharacterStartLocation.left) {
      position = Vector2(size.x / 2, 0);
      leftBorder = 0.0;
      rightBorder = gameRef.size.x / 3;
      direction = CharacterDirection.left;
    } else {
      rightBorder = gameRef.size.x - size.x / 2;
      leftBorder = gameRef.size.x * .6;
      position = Vector2(gameRef.size.x - size.x / 2, 0);
      direction = CharacterDirection.right;
    }

    return super.onLoad();
  }

  @override
  void update(double dt) {
    switch (direction) {
      case CharacterDirection.left:
        if (x - size.x / 2 > leftBorder) {
          if (move) {
            x -= 50 * dt;
          }
        } else {
          direction = CharacterDirection.right;
          move = false;
          if (randomNumberGenerator.nextBool()) {
            sprite = sprites[randomNumberGenerator.nextInt(sprites.length)];
          }
          if (randomNumberGenerator.nextBool()) {
            flipHorizontallyAroundCenter();
          }
        }
        break;
      case CharacterDirection.right:
        if (x < rightBorder) {
          if (move) {
            x += 50 * dt;
          }
        } else {
          direction = CharacterDirection.left;
          move = false;
          if (randomNumberGenerator.nextBool()) {
            flipHorizontallyAroundCenter();
          }
          if (randomNumberGenerator.nextBool()) {
            sprite = sprites[randomNumberGenerator.nextInt(sprites.length)];
          }
        }
        break;
    }

    interval.update(dt);
    super.update(dt);
  }
}
