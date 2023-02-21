import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:jenny/jenny.dart';

import 'main.dart';

class ProjectViewComponent extends PositionComponent
    with DialogueView, HasGameRef<JennyGame> {
  late final TextBoxComponent mainDialogueTextComponent;
  final dialoguePaint = TextPaint(
      style: const TextStyle(
          backgroundColor: Color.fromARGB(180, 158, 158, 158), fontSize: 30));
  final background = SpriteComponent();
  final girl = SpriteComponent();
  final boy = SpriteComponent();
  late final ButtonComponent forwardButtonComponent;
  // to control flow with button presses
  Completer<void> _forwardCompleter = Completer();

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

    forwardButtonComponent = ButtonComponent(
        button: PositionComponent(),
        size: gameRef.size,
        onPressed: () {
          if (!_forwardCompleter.isCompleted) {
            _forwardCompleter.complete();
          }
        });
    mainDialogueTextComponent = TextBoxComponent(
      text: 'Press next to begin the story of Ken and Akemi',
      position: Vector2(50, gameRef.size.y * .8),
      boxConfig: TextBoxConfig(maxWidth: gameRef.size.x * .8),
      textRenderer: dialoguePaint,
    );
    addAll([
      background,
      girl,
      boy,
      forwardButtonComponent,
      mainDialogueTextComponent
    ]);
    return super.onLoad();
  }

  @override
  FutureOr<bool> onLineStart(DialogueLine line) async {
    _forwardCompleter = Completer();
    await _advance(line);
    return super.onLineStart(line);
  }

  Future<void> _advance(DialogueLine line) async {
    var characterName = line.character?.name ?? '';
    var dialogueLineText = '$characterName: ${line.text}';
    mainDialogueTextComponent.text = dialogueLineText;
    debugPrint('debug: $dialogueLineText');
    return _forwardCompleter.future;
  }
}
