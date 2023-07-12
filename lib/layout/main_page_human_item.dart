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
  String path; // thumbUri
  String name; // 조원명
  String position; // 조원 포지션(팀장, 팀원)
  String mbti; // 조원 mbti
  void Function()? func; // 클릭시 페이지 이동처리를위해 함수를 변수로 받음.

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Card(
        /// 카드 아래쪽 그림자 설정. 숫자가 높을수록 그림자가 진해짐.
        elevation: 20,
        color: Color.fromARGB(255, 249, 216, 151),

        /// 카드의 모서리를 둥글게 설정함.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// path의 값이 없는지 체크.
            path == ""

                /// path의 값이 없을경우 기본이미지를 보여줌.(스마일 그림)
                ? Image.asset(
                    path,
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                  )

                /// path가 존재할경우 인터넷에서 이미지를 불러와 보여줌.
                : Image.network(
                    path,
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),

            /// 사진 아래에 들어가는 이름 / 포지션(팀장,팀원) / MBTI.
            Padding(
                padding: EdgeInsets.all(5),
                child: Text("$name / $position / $mbti")),
          ],
        ),
      ),
    );
  }
}
