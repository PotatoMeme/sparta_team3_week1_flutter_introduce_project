import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/human.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/introduce_edit_page.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/introduce_service.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/webview_page.dart';

class IntroducePage extends StatefulWidget {
  const IntroducePage(
      {super.key, this.idx = 0}); //생성자를 이용하여 idx(몇번째 사람인지 확인요) 값을 받아옵니다.
  final int idx;
  @override
  State<IntroducePage> createState() => _IntroducePageState();
}

class _IntroducePageState extends State<IntroducePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IntroduceService>(
        //edit에서 수정할경우 edit에서나왔을때 값이 바뀌어 있을경우 화면을 최신화해야하므로 prvider의 consumer를 이용합니다.
        builder: (context, introduceService, child) {
      int _idx = widget.idx;
      Human currentHumman =
          introduceService.humanList[_idx]; //idx값에 맞는 Human객체를 받아옵니다.
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Member",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                //수정버튼을 누를경우
                showBasicDialog(
                  context,
                  "수정하시겠습니까?",
                  () {
                    Navigator.push(
                      //수정페이지로 이동합니다.
                      context,
                      MaterialPageRoute(
                          builder: (_) => IntroduceEditPage(
                                idx: widget.idx,
                              )),
                    );
                  },
                ); //다이얼로그를 보여줘 한번더 확인 합니다.
              },
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                //삭제버튼을 누를경우
                showBasicDialog(
                  context,
                  "삭제하시겠습니까?",
                  () {
                    Navigator.pop(context); //페이지를 끕니다.
                    Timer(Duration(seconds: 1), () {
                      introduceService.deleteHuman(index: _idx);
                    });
                  },
                ); //다이얼로그를 보여줘 한번더 확인 합니다.
              },
              icon: Icon(Icons.delete),
            )
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(currentHumman
                              .thumbUrl), //thumbUrl을 이용하여 이미지를 받아옵니다.
                          radius: 75.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            currentHumman.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          "직책 : ${currentHumman.posittion} / 취미 : ${currentHumman.hobby} / mbti : ${currentHumman.mbti}", //직책,취미,mbti를 한줄에 보여줍니다.
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8.0),
                    color: Color.fromARGB(255, 217, 221, 244),
                    child: Row(
                      children: [
                        Text(
                          "블로그 주소",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 5,
                        ),
                        Flexible(
                            child: TextButton(
                          child: Text(
                            currentHumman.blogUrl, //블로그주소를 보여줍니다.
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onPressed: () {
                            //블로그 주소를 클릭할경우의 로직입니다.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => WebViewPage(
                                        url: currentHumman.blogUrl,
                                      )), //블로그 주소를 넘겨줘url을 불러옵니다.
                            );
                          },
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "스타일",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
                    color: Color.fromARGB(255, 217, 221, 244),
                    child: Text(currentHumman.style), //스타일을 보여줍니다.
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "장점",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
                    color: Color.fromARGB(255, 217, 221, 244),
                    child: Text(currentHumman.advantages), //장점을 보여줍니다.
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "목표",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
                    color: Color.fromARGB(255, 217, 221, 244),
                    child: Text(currentHumman.goal), //목표를 보여줍니다.
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void showBasicDialog(
      BuildContext context, String text, Function() dialogClosed) {
    //여부를 묻는 다이얼로그를 보여주는 함수입니다.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text), //묻는곳입니다
          actions: [
            TextButton(
              onPressed: () {
                //예버튼을 누를경우의 로직
                Navigator.pop(context); //다이얼로그를 끕니다.
                dialogClosed(); //예를 누를경우에만 수행
              },
              child: Text("예"),
            ),
            TextButton(
              onPressed: () {
                //아니오버튼을 누를경우의 로직입니다.
                Navigator.pop(context); //다이얼로그를 끕니다.
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
