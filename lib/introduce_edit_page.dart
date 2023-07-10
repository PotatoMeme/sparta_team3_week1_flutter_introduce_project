import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroduceEditPage extends StatelessWidget {
  const IntroduceEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("소개 수정 페이지"),
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
