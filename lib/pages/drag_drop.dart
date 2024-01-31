import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:web_task/pages/widgets.dart';

class DragAndDrop extends StatefulWidget {
  const DragAndDrop({super.key});

  @override
  State<DragAndDrop> createState() => _DragAndDropState();
}

final AppFlowyBoardController controller = AppFlowyBoardController(
  onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
    debugPrint('Move item from $fromIndex to $toIndex');
  },
  onMoveGroupItem: (groupId, fromIndex, toIndex) {
    debugPrint('Move $groupId:$fromIndex to $groupId:$toIndex');
  },
  onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
    debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
  },
);

class _DragAndDropState extends State<DragAndDrop> {
  @override
  void initState() {
    final group1 = AppFlowyGroupData(
        id: "1",
        items: [
          TextItem("Card 1"),
          TextItem("Card 2"),
        ],
        name: 'First');
    final group2 = AppFlowyGroupData(
        id: "2",
        items: [
          TextItem("Card 3"),
          TextItem("Card 4"),
        ],
        name: 'Second');

    final group3 = AppFlowyGroupData(
        id: "3",
        items: [
          TextItem("Card 5"),
          TextItem("Card 6"),
          TextItem("Card 7"),
        ],
        name: 'Third');
    controller.addGroup(group1);
    controller.addGroup(group2);
    controller.addGroup(group3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppFlowyBoard(
      config: const AppFlowyBoardConfig(
        groupPadding: EdgeInsets.symmetric(horizontal: 5),
        groupItemPadding: EdgeInsets.zero,
      ),
      headerBuilder: (context, groupData) {
        return CategoryContainer(
          status: _statusSetter(groupData.id),
          count: groupData.items.length,
        );
      },
      controller: controller,
      cardBuilder: (context, group, groupItem) {
        final textItem = groupItem as TextItem;
        return AppFlowyGroupCard(
          margin: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(color: Colors.transparent),
          key: ObjectKey(textItem),
          child: const NotesContainer(
            state: NoteState.middle,
            index: 1,
          ),
        );
      },
      groupConstraints: const BoxConstraints.tightFor(width: 350),
    );
  }

  _statusSetter(String id) {
    if (id == '1') {
      return NoteStatus.done;
    } else if (id == '2') {
      return NoteStatus.onProgress;
    } else {
      return NoteStatus.newStatus;
    }
  }
}

class TextItem extends AppFlowyGroupItem {
  final String s;

  TextItem(this.s);

  @override
  String get id => s;

  @override
  set draggable(IsDraggable _draggable) {
    super.draggable = false;
  }
}
