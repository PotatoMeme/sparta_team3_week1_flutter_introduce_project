import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'public_thing.dart';
import 'public_thing_service.dart';

void showSaveConfirmationDialog(
    BuildContext context,
    List<TextEditingController> contentControllerList,
    int index,
    bool multiSingle) {
  PublicThingService publicThingService = context.read<PublicThingService>();

  List<PublicThing> publicThingList = publicThingService.publicThingList;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('저장확인'),
        content: Text('변경 사항을 저장하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () {
              if (multiSingle == true) {
                for (int i = 0; i < publicThingList.length; i++) {
                  publicThingService.updatePublicThing(
                      idx: i, changed: contentControllerList[i].text);
                }
              }
              if (multiSingle == false) {
                publicThingService.updatePublicThing(
                    idx: index, changed: contentControllerList[0].text);
              }
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('예'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              '아니요',
              style: TextStyle(color: Colors.pink),
            ),
          ),
        ],
      );
    },
  );
}
