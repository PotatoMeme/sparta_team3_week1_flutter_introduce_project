import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/introduce_page.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("메인 페이지"),
      ),
      body: Column(
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => IntroducePage()),
              );
            },
            child: Text("소개페이지로 이동"),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PublicPage()),
              );
            },
            child: Text("공공페이지로 이동"),
          ),
        ],
      ),
    );
  }
}
