import 'dart:async';

import 'package:flame/components.dart';
import 'package:jenny/jenny.dart';

import 'main.dart';

class ProjectViewComponent extends PositionComponent
    with DialogueView, HasGameRef<JennyGame> {
  final background = SpriteComponent();
  final girl = SpriteComponent();
  final boy = SpriteComponent();

  @override
  FutureOr<void> onLoad() {
    background
      ..sprite = gameRef.boatBackgroundSprite
      ..size = gameRef.size;
    girl
      ..sprite = gameRef.girlSprite
      ..size = Vector2(400, 800);

    boy
      ..sprite = gameRef.boySprite
      ..size = Vector2(400, 800)
      ..position = Vector2(gameRef.size.x * .7, 0);

    addAll([background, girl, boy]);
    return super.onLoad();
  }
}
