import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PublicEditMultiPage extends StatelessWidget {
  const PublicEditMultiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("약속멀티수정 페이지"),
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
