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
  late Sprite girlSprite;
  late Sprite boySprite;
  YarnProject yarnProject = YarnProject();
  ProjectViewComponent projectViewComponent = ProjectViewComponent();

  @override
  FutureOr<void> onLoad() async {
    boatBackgroundSprite = await loadSprite('boat.webp');
    girlSprite = await loadSprite('girl.webp');
    boySprite = await loadSprite('guy.webp');

    String startDialogueData =
        await rootBundle.loadString('assets/yarn/start.yarn');
    yarnProject.parse(startDialogueData);

    var dialogueRunner = DialogueRunner(
        yarnProject: yarnProject, dialogueViews: [projectViewComponent]);
    dialogueRunner.startDialogue('Boat_Meeting');
    add(projectViewComponent);
    return super.onLoad();
  }
}
