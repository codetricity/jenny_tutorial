import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';

enum CharacterDirection { left, right }

enum CharacterStartLocation { left, right }

class CharacterComponent extends SpriteComponent with HasGameRef {
  final List<Sprite> sprites;
  final double movementSpeed;
  final CharacterStartLocation startLocation;
  final double maxTimeToMove;
  final double minTimeToMove;
  CharacterComponent(
      {required this.sprites,
      required this.startLocation,
      this.maxTimeToMove = 15.0,
      this.minTimeToMove = 8.0,
      this.movementSpeed = 50})
      : super(anchor: Anchor.topCenter);
  late Timer interval;
  bool move = false;
  late CharacterDirection direction;

  final randomNumberGenerator = Random();
  var leftBorder = 0.0;
  var rightBorder = 0.0;

  @override
  FutureOr<void> onLoad() {
    if (startLocation == CharacterStartLocation.left) {
      position = Vector2(size.x / 2, 0);
      direction = CharacterDirection.left;
    } else {
      // print('starting with character on right');
      position = Vector2(gameRef.size.x - size.x / 2, 0);

      direction = CharacterDirection.right;
    }

    sprite = sprites[0];
    double randomMultiplier = maxTimeToMove - minTimeToMove;
    double moveIntervalTime =
        randomNumberGenerator.nextDouble() * randomMultiplier + minTimeToMove;
    print('time between character movement: $moveIntervalTime');
    interval = Timer(moveIntervalTime, onTick: () {
      move = !move;

      // print('direction: $direction, move: $move');
    }, repeat: true);
    if (startLocation == CharacterStartLocation.left) {
      leftBorder = 0;
      rightBorder = gameRef.size.x / 3;
    } else {
      leftBorder = gameRef.size.x * .6;
      rightBorder = gameRef.size.x - size.x / 2;
    }
    return super.onLoad();
  }

  @override
  void update(double dt) {
    switch (direction) {
      case CharacterDirection.left:
        if (x - size.x / 2 > leftBorder) {
          if (move) {
            x -= movementSpeed * dt;
          }
        } else {
          direction = CharacterDirection.right;
          move = false;
          if (randomNumberGenerator.nextBool()) {
            flipHorizontallyAroundCenter();
          }
          if (randomNumberGenerator.nextBool()) {
            sprite = sprites[randomNumberGenerator.nextInt(sprites.length)];
          }
        }
        break;
      case CharacterDirection.right:
        if (x < rightBorder) {
          if (move) {
            x += movementSpeed * dt;
          }
        } else {
          // print('set chracter direction to left');
          direction = CharacterDirection.left;
          move = false;
          if (randomNumberGenerator.nextBool()) {
            flipHorizontallyAroundCenter();
          }
          if (randomNumberGenerator.nextBool()) {
            sprite = sprites[randomNumberGenerator.nextInt(sprites.length)];
          }
        }
    }

    interval.update(dt);
    super.update(dt);
  }
}
