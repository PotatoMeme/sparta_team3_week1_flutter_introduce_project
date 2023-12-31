import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/human.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/introduce_service.dart';

//소개를 수정하는 페이지 입니다.
class IntroduceEditPage extends StatelessWidget {
  //몇번째 값을 가져와야하는지 알아야하기때문에 생성자에서 idx값을 받아옵니다.
  const IntroduceEditPage({super.key, required this.idx});
  final int idx;

  @override
  Widget build(BuildContext context) {
    ////소개를 추가할려면 서비스를 가져와야하므로 context.read로 서비스를 가져옵니다.
    IntroduceService introduceService = context.read<IntroduceService>();
    Human currentHuman = introduceService.humanList[idx];
    //text의 입력을 TextEditingController를 통해 introduceService로 전달해줘야 하므로 정의해줍니다
    //또한 위에서 지정한 currentHuman의 값들을 컨틀롤러의 text에 넣어줘서 기존의 값들을넣어 줍니다.
    TextEditingController textEditingControllerName =
        TextEditingController(text: currentHuman.name);
    TextEditingController textEditingControllerPosition =
        TextEditingController(text: currentHuman.posittion);
    TextEditingController textEditingControllerHobby =
        TextEditingController(text: currentHuman.hobby);
    TextEditingController textEditingControllerBlogUrl =
        TextEditingController(text: currentHuman.blogUrl);
    TextEditingController textEditingControllerStyle =
        TextEditingController(text: currentHuman.style);
    TextEditingController textEditingControllerAdvantages =
        TextEditingController(text: currentHuman.advantages);
    TextEditingController textEditingControllerMBTI =
        TextEditingController(text: currentHuman.mbti);
    TextEditingController textEditingControllerGoal =
        TextEditingController(text: currentHuman.goal);
    TextEditingController textEditingControllerThumUrl =
        TextEditingController(text: currentHuman.thumbUrl);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Page 'Member'",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //저장버튼을 누를 경우의 로직임
              //저장로직을 구현해야함
              showUpdateDialog(
                  context,
                  () => {
                        introduceService.updateHuman(
                            index: idx,
                            //입력을 바탕으로 Human을 새로 만들어 updateHuman함수를 통하여 기존의 idx값의 내용을 바꿔줍니다.
                            changed: Human(
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
                  controller:
                      textEditingControllerName, //항목에 맞게 TextEditingController를 집어넣어 줍니다
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
                  controller:
                      textEditingControllerPosition, //항목에 맞게 TextEditingController를 집어넣어 줍니다
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
                  controller:
                      textEditingControllerHobby, //항목에 맞게 TextEditingController를 집어넣어 줍니다
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
                  controller:
                      textEditingControllerBlogUrl, //항목에 맞게 TextEditingController를 집어넣어 줍니다
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
                  controller:
                      textEditingControllerStyle, //항목에 맞게 TextEditingController를 집어넣어 줍니다
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
                  controller:
                      textEditingControllerAdvantages, //항목에 맞게 TextEditingController를 집어넣어 줍니다
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
                  controller:
                      textEditingControllerMBTI, //항목에 맞게 TextEditingController를 집어넣어 줍니다
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
                  controller:
                      textEditingControllerGoal, //항목에 맞게 TextEditingController를 집어넣어 줍니다
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
                  controller:
                      textEditingControllerThumUrl, //항목에 맞게 TextEditingController를 집어넣어 줍니다
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showUpdateDialog(BuildContext context, Function() dialogClosed) {
    //수정여부를 묻는 다이얼로그를 보여주는 함수입니다.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("수정하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () {
                //예버튼을 누를경우의 로직
                Navigator.pop(context); //다이얼로그를 끕니다.
                Navigator.pop(context); //페이지를 끕니다.
                dialogClosed(); //예버튼을 누를경우 위에 입력한  dialogClosed를 호출해줍니다
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
