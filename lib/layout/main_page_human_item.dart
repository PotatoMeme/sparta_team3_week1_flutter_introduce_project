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
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Card(
          elevation: 1,
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(path, scale: 0.5),
              Text("$name / $position / $mbti"),
            ],
          ),
        ),
      ),
    );
  }
}
