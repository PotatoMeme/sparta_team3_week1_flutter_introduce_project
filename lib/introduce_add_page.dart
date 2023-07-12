import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/human.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/introduce_service.dart';

class IntroduceAddPage extends StatelessWidget {
  const IntroduceAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    IntroduceService introduceService = context.read<IntroduceService>();
    TextEditingController textEditingControllerName = TextEditingController();
    TextEditingController textEditingControllerPosition =
        TextEditingController();
    TextEditingController textEditingControllerHobby = TextEditingController();
    TextEditingController textEditingControllerBlogUrl =
        TextEditingController();
    TextEditingController textEditingControllerStyle = TextEditingController();
    TextEditingController textEditingControllerAdvantages =
        TextEditingController();
    TextEditingController textEditingControllerMBTI = TextEditingController();
    TextEditingController textEditingControllerGoal = TextEditingController();
    TextEditingController textEditingControllerThumUrl =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "소개 추가 페이지",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //저장로직을 구현해야함
              showCreateDialog(
                  context,
                  () => {
                        introduceService.createHuman(
                            human: Human(
                                name: textEditingControllerName.text,
                                posittion: textEditingControllerPosition.text,
                                hobby: textEditingControllerHobby.text,
                                blogUrl: textEditingControllerBlogUrl.text,
                                style: textEditingControllerStyle.text,
                                advantages:
                                    textEditingControllerAdvantages.text,
                                mbti: textEditingControllerMBTI.text,
                                goal: textEditingControllerGoal.text,
                                thumbUrl: textEditingControllerThumUrl.text))
                      }); //다이얼로그를 보여줘 한번더 확인 합니다.
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "이름",
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                margin: EdgeInsets.all(3),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: textEditingControllerName,
                ),
              ),
              Text(
                "직책",
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                margin: EdgeInsets.all(3),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: textEditingControllerPosition,
                ),
              ),
              Text(
                '취미및특기',
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                margin: EdgeInsets.all(3),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: textEditingControllerHobby,
                ),
              ),
              Text(
                "블로그",
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                margin: EdgeInsets.all(3),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: textEditingControllerBlogUrl,
                ),
              ),
              Text(
                "자신의 협업 스타일",
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                margin: EdgeInsets.all(3),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: textEditingControllerStyle,
                ),
              ),
              Text(
                "장점",
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                margin: EdgeInsets.all(3),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: textEditingControllerAdvantages,
                ),
              ),
              Text(
                "MBTI",
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                margin: EdgeInsets.all(3),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: textEditingControllerMBTI,
                ),
              ),
              Text(
                "목표",
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                margin: EdgeInsets.all(3),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: textEditingControllerGoal,
                ),
              ),
              Text(
                "이미지 주소",
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                margin: EdgeInsets.all(3),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: textEditingControllerThumUrl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showCreateDialog(BuildContext context, Function() dialogClosed) {
    //수정여부를 묻는 다이얼로그를 보여주는 함수입니다.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("추가하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () {
                //예버튼을 누를경우의 로직
                Navigator.pop(context); //다이얼로그를 끕니다.
                Navigator.pop(context); //페이지를 끕니다.
                dialogClosed();
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
