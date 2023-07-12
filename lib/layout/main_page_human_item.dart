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
        elevation: 20,
        color: Color.fromARGB(255, 249, 216, 151),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            path == ""
                ? Image.asset(
                    path,
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                  )
                : Image.network(
                    path,
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
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
