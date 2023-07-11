import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'public_page.dart';

void showSaveConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('저장확인'),
        content: Text('변경 사항을 저장하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PublicPage()),
              );
            },
            child: Text('취소'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PublicPage()),
              );
            },
            child: Text('확인'),
          )
        ],
      );
    },
  );
}
