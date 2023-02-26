import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:jenny/jenny.dart';

import 'project_view_component.dart';

void main() {
  runApp(
    GameWidget(
      game: JennyGame(),
    ),
  );
}

class JennyGame extends FlameGame with HasTappables {
  late Sprite boatBackgroundSprite;
  late Sprite cafeBackgroundSprite;
  late Sprite beachBackgroundSprite;
  late Sprite girlSprite;
  late Sprite girlSurprisedSprite;
  late Sprite girlSwimwearSprite;
  late Sprite boySprite;
  late Sprite boySwimwearSprite;
  YarnProject yarnProject = YarnProject();
  ProjectViewComponent projectViewComponent = ProjectViewComponent();

  @override
  FutureOr<void> onLoad() async {
    boatBackgroundSprite = await loadSprite('boat.webp');
    cafeBackgroundSprite = await loadSprite('cafe.webp');
    beachBackgroundSprite = await loadSprite('beach.webp');
    girlSprite = await loadSprite('girl.webp');
    girlSurprisedSprite = await loadSprite('akemi_surprised.webp');
    girlSwimwearSprite =
        await loadSprite('akemi/akemi_swimwear_surprised.webp');
    boySprite = await loadSprite('guy.webp');
    boySwimwearSprite = await loadSprite('ken/ken_swimwear_concerned.webp');

    String startDialogueData =
        await rootBundle.loadString('assets/yarn/start.yarn');
    String cafeData = await rootBundle.loadString('assets/yarn/cafe.yarn');
    String beachData = await rootBundle.loadString('assets/yarn/beach.yarn');
    yarnProject
      ..parse(startDialogueData)
      ..parse(cafeData)
      ..parse(beachData);

    var dialogueRunner = DialogueRunner(
        yarnProject: yarnProject, dialogueViews: [projectViewComponent]);
    dialogueRunner.startDialogue('Boat_Meeting');
    add(projectViewComponent);
    return super.onLoad();
  }
}
