import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:jenny/jenny.dart';

import 'character_component.dart';
import 'main.dart';

class ProjectViewComponent extends PositionComponent
    with DialogueView, HasGameRef<JennyGame> {
  late final TextBoxComponent mainDialogueTextComponent;
  final dialoguePaint = TextPaint(
      style: const TextStyle(
          backgroundColor: Color.fromARGB(180, 85, 84, 84), fontSize: 36));
  final background = SpriteComponent();
  late CharacterComponent girl;
  late CharacterComponent boy;
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
    girl = CharacterComponent(
        sprites: [gameRef.girlSprite, gameRef.girlSurprisedSprite],
        startLocation: CharacterStartLocation.left)
      ..size = Vector2(400, 800);

    boy = CharacterComponent(
        sprites: [gameRef.boySprite],
        startLocation: CharacterStartLocation.right)
      ..size = Vector2(400, 800);

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
      priority: 5,
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
            position: Vector2(30, i * 70 + 100),
            button: TextComponent(
              text: 'Choice ${i + 1}: ${choice.options[i].text}',
              textRenderer: dialoguePaint,
            ),
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

  @override
  FutureOr<void> onNodeStart(Node node) {
    switch (node.title) {
      case 'Cafe':
        background.sprite = gameRef.cafeBackgroundSprite;
        break;
      case 'Beach':
        background.sprite = gameRef.beachBackgroundSprite;
        girl.removeFromParent();
        boy.removeFromParent();
        girl = CharacterComponent(
            sprites: [gameRef.girlSwimwearSprite],
            startLocation: CharacterStartLocation.left)
          ..size = Vector2(400, 800);

        boy = CharacterComponent(
            sprites: [gameRef.boySwimwearSprite],
            startLocation: CharacterStartLocation.right)
          ..size = Vector2(400, 800);
        addAll([girl, boy]);
        break;
    }
    return super.onNodeStart(node);
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
