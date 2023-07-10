import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/human.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/introduce_edit_page.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/webview_page.dart';

class IntroducePage extends StatelessWidget {
  const IntroducePage({super.key});

  @override
  Widget build(BuildContext context) {
    Human currentHumman = Human(
        name: "홍길동",
        posittion: "팀원",
        hobby: "독서",
        blogUrl: "https://seedpotato.tistory.com/",
        style: "저는 이러한 스타일을 가지고 있습니다",
        advantages: "저는 이러한 장점을 가지고 있습니다.",
        mbti: "AAAA",
        goal: "좋은 개발자",
        thumbUrl:
            "https://avatars.akamai.steamstatic.com/d18545996fbbc474a47e76c566c8a9ac7b09e8d0_full.jpg");
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDeleteDialog(context);
            },
            icon: Icon(Icons.edit),
          )
        ],
      ),
      body: Column(
        children: [
          OutlinedButton(
            onPressed: () {},
            child: Text("소개수정페이지로 이동"),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => WebViewPage(
                          url: currentHumman.blogUrl,
                        )),
              );
            },
            child: Text("웹뷰페이지로 이동"),
          ),
        ],
      ),
    );
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("수정하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => IntroduceEditPage()),
                );
              },
              child: Text("예"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "아니오",
                style: TextStyle(color: Colors.pink),
              ),
            ),
          ],
        );
      },
    );
  }
}
