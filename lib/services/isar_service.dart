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

  Future<void> updateStoryNode(String newNodeName) async {
    final isar = await db;
    if (await isar.storyNodes.count() > 0) {
      final storyNode = await isar.storyNodes.get(1);
      storyNode!.nodeName = newNodeName;
      isar.writeTxnSync(() => isar.storyNodes.putSync(storyNode));
    }
  }

  Future<String> getFirstStoryNode() async {
    final isar = await db;
    if (await isar.storyNodes.count() > 0) {
      final storyNode = await isar.storyNodes.get(1);
      if (storyNode!.nodeName == null) {
        return 'Start_Story';
      } else {
        return storyNode.nodeName.toString();
      }
    } else {
      return 'Start_Story';
    }
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([StoryNodeSchema]);
    }
    return await Future.value(Isar.getInstance());
  }
}
