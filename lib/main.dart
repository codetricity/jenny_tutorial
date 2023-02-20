import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'project_view_component.dart';

void main() {
  runApp(
    GameWidget(
      game: JennyGame(),
    ),
  );
}

class JennyGame extends FlameGame {
  late Sprite boatBackgroundSprite;
  late Sprite girlSprite;
  late Sprite boySprite;

  @override
  FutureOr<void> onLoad() async {
    boatBackgroundSprite = await loadSprite('boat.webp');
    girlSprite = await loadSprite('girl.webp');
    boySprite = await loadSprite('guy.webp');

    add(ProjectViewComponent());
    return super.onLoad();
  }
}
