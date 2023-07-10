import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PublicEditSinglePage extends StatelessWidget {
  const PublicEditSinglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("약속단일수정 페이지"),
      ),
      body: Column(
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("저장하기"),
          ),
        ],
      ),
    );
  }
}
