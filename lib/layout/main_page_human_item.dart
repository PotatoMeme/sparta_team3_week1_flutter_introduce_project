import 'package:flutter/material.dart';

/// 메인페이지에서 사용되는 사람 얼굴 Item
class MainPageHumanItem extends StatelessWidget {
  MainPageHumanItem({
    Key? key,
    required this.path,
    required this.name,
    required this.position,
    required this.mbti,
    required this.func,
  }) : super(key: key);
  String path;
  String name;
  String position;
  String mbti;
  void Function()? func;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              path,
              width: 100,
              height: 100,
            ),
            Padding(
                padding: EdgeInsets.all(5),
                child: Text("$name / $position / $mbti")),
          ],
        ),
      ),
    );
  }
}
