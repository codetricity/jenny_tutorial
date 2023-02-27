import 'package:isar/isar.dart';

import '../data/story_node.dart';

class IsarService {
  late Future<Isar> db;
  IsarService() {
    db = openDB();
  }

  Future<void> addStoryNode(StoryNode storyNode) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.storyNodes.putSync(storyNode));
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([StoryNodeSchema]);
    }
    return await Future.value(Isar.getInstance());
  }
}
