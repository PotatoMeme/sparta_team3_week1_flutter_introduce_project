import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_edit_multi_page.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_edit_single_page.dart';

class PublicPage extends StatelessWidget {
  const PublicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("약속 페이지"),
      ),
      body: Column(
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PublicEditSinglePage()),
              );
            },
            child: Text("약속단일수정페이지로 이동"),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PublicEditMultiPage()),
              );
            },
            child: Text("약속멀티수정페이지로 이동"),
          ),
        ],
      ),
    );
  }
}
