import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/human.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/introduce_edit_page.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/introduce_page.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/introduce_service.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/layout/main_page_human_item.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  final String DEFAULT_IMG_PATH = "assets/images/smile.png";

  @override
  Widget build(BuildContext context) {
    List<Human> humanList = context.read<IntroduceService>().humanList;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 216, 151),
      appBar: AppBar(
        title: Text("메인 페이지"),
      ),
      body: Column(
        children: [
          /// 칠판부분(우리팀의 약속)
          SizedBox(
            width: MediaQuery.of(context).size.width,

            /// assets/images에 있는 board.png룰 불러와 화면에 보여줌
            /// Stack을 쓴 이유는 이미지 위에 글자를 보이게 하기위함.
            child: Stack(
              alignment: Alignment.center,
              children: [
                /// assets의 이미지 로드
                Image.asset(
                  'assets/images/board.png',
                  fit: BoxFit.fitWidth,
                ),

                /// 이미지 터치시 PublicPage로 이동시켜 우리의 약속을 띄우기위함.
                /// InkWell을 사용한 이유는 onTap을 사용해 페이지 이동을 시키기 위해.
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => PublicPage()),
                    );
                  },

                  /// 우리팀의 약속 텍스트.
                  child: Text(
                    "우리팀의 약속\n팀설명\n우리 팀만의 특징\n추구하는 궁극적인 목표\n",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
              ],
            ),
          ),

          /// 맴버 글자 & 이모지
          Padding(
            padding: EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.centerLeft,

              /// 텍스트 앞의 문자는 유니코드에 존재하는 이모티콘을 사용함.
              /// https://apps.timwhitlock.info/emoji/tables/unicode
              child: Text(
                "\u{1F465} 맴버",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          /// 팀원 카드 ListView
          SizedBox(
            /// 화면 크기를 가져오는 코드. 기기마다 다른 화면크기이므로 기기에 맞게 레이아웃을 잡아주기 위해 사용.
            width: MediaQuery.of(context).size.width - 10,
            height: MediaQuery.of(context).size.height * 0.18,
            child: Row(
              children: [
                /// ListView의 크기를 지정해주지않으면 앱에서 볼 수 없기때문에 Flexible을 사용하여 지정함.
                Flexible(
                  child: ListView.builder(

                      /// ListView의 스크롤 방향설정. 가로스크롤을 사용하기위해 씀.
                      scrollDirection: Axis.horizontal,
                      itemCount: humanList.length,
                      itemBuilder: (context, index) {
                        /// 카드 레이아웃 페이지.
                        return MainPageHumanItem(
                          path: humanList[index].thumbUrl,
                          name: humanList[index].name,
                          position: humanList[index].posittion,
                          mbti: humanList[index].mbti,
                          func: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => IntroducePage(
                                        idx: index,
                                      )),
                            );
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),

      /// 오른쪽 아래 +버튼 만들기.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => IntroduceEditPage(),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}
