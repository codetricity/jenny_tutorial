import 'package:isar/isar.dart';

part 'story_node.g.dart';

@collection
class StoryNode {
  Id id = Isar.autoIncrement;
  String? nodeName;
}
