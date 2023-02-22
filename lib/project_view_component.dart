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
  Completer<int> _choiceCompleter = Completer<int>();

  List<ButtonComponent> optionsList = [];

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

  @override
  FutureOr<int?> onChoiceStart(DialogueChoice choice) async {
    _choiceCompleter = Completer<int>();
    forwardButtonComponent.removeFromParent();
    mainDialogueTextComponent.text = 'make your choice';
    for (int i = 0; i < choice.options.length; i++) {
      optionsList.add(
        ButtonComponent(
            position: Vector2(30, i * 50 + 50),
            button: TextComponent(
                text: 'Choice ${i + 1}: ${choice.options[i].text}'),
            onPressed: () {
              if (!_choiceCompleter.isCompleted) {
                _choiceCompleter.complete(i);
              }
            }),
      );
    }
    addAll(optionsList);
    await _getChoice(choice);
    return _choiceCompleter.future;
  }

  @override
  FutureOr<void> onChoiceFinish(DialogueOption option) {
    mainDialogueTextComponent.text = 'decision is ${option.text}';
    removeAll(optionsList);
    optionsList = [];
    add(forwardButtonComponent);
  }

  Future<void> _getChoice(DialogueChoice choice) async {
    return _forwardCompleter.future;
  }

  Future<void> _advance(DialogueLine line) async {
    var characterName = line.character?.name ?? '';
    var dialogueLineText = '$characterName: ${line.text}';
    mainDialogueTextComponent.text = dialogueLineText;
    debugPrint('debug: $dialogueLineText');
    return _forwardCompleter.future;
  }
}
