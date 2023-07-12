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
          SizedBox(
            width: MediaQuery.of(context).size.width,
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
          Padding(
            padding: EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "\u{1F465} 맴버",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 10,
            height: MediaQuery.of(context).size.height * 0.18,
            child: Row(
              children: [
                Flexible(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: humanList.length,
                      itemBuilder: (context, index) {
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
