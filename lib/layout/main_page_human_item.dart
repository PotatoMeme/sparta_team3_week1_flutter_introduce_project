import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/introduce_page.dart';

/// 메인페이지에서 사용되는 사람 얼굴 Item
class MainPageHumanItem extends StatelessWidget {
  MainPageHumanItem({
    Key? key,
    required this.name,
    required this.path,
  }) : super(key: key);
  String name;
  String path;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => IntroducePage()),
        );
      },
      child: Container(
        alignment: Alignment.topCenter,
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            image: AssetImage(path),
          ),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
