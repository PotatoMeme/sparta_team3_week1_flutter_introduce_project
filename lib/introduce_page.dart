import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/human.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/introduce_edit_page.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/introduce_service.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/webview_page.dart';

class IntroducePage extends StatefulWidget {
  const IntroducePage({super.key, this.idx = 0});
  final int idx;
  @override
  State<IntroducePage> createState() => _IntroducePageState();
}

class _IntroducePageState extends State<IntroducePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IntroduceService>(
        builder: (context, introduceService, child) {
      int _idx = widget.idx;
      Human currentHumman = introduceService.humanList[_idx];
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showDeleteDialog(context);
              },
              icon: Icon(Icons.edit),
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
                          backgroundImage: NetworkImage(currentHumman.thumbUrl),
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
                          "직책 : ${currentHumman.posittion} / 취미 : ${currentHumman.hobby} / mbti : ${currentHumman.mbti}",
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
                            currentHumman.blogUrl,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => WebViewPage(
                                        url: currentHumman.blogUrl,
                                      )),
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
                    child: Text(currentHumman.style),
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
                    child: Text(currentHumman.advantages),
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
                    child: Text(currentHumman.goal),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("수정하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => IntroduceEditPage()),
                );
              },
              child: Text("예"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
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
