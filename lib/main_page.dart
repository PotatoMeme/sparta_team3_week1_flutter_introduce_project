import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/introduce_edit_page.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/introduce_page.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/layout/main_page_human_item.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  final String DEFAULT_IMG_PATH = "assets/images/smile.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 216, 151),
      appBar: AppBar(
        title: Text("메인 페이지"),
      ),
      body: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/board.png',
                  fit: BoxFit.fitWidth,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => PublicPage()),
                    );
                  },
                  child: Text(
                    "우리팀의 약속\n팀설명\n우리 팀만의 특징\n추구하는 궁극적인 목표\n",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        crossAxisCount: 2,
                        childAspectRatio: 0.85,
                      ),
                      itemBuilder: (context, index) {
                        return MainPageHumanItem(
                          path: DEFAULT_IMG_PATH,
                          name: "홍길동",
                          position: "팀장",
                          mbti: "ENFP",
                          func: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => IntroducePage()),
                            );
                          },
                        );
                      }),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => IntroduceEditPage()),
                    );
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
