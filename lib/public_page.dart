import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_edit_multi_page.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_edit_single_page.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_thing.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_thing_service.dart';

class PublicPage extends StatelessWidget {
  PublicPage({super.key});
  var publicList = ['우리의 약속', '추구하는 궁극적인 목표', '우리의 규칙', '우리팀만의 특징'];
  @override
  Widget build(BuildContext context) {
    return Consumer<PublicThingService>(
      builder: (value, publicThingService, child) {
        List<PublicThing> publicThingList = publicThingService.publicThingList;
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 240, 250, 232),
          appBar: AppBar(
            title: Text("약속 페이지"),
            actions: [
              IconButton(
                icon: Icon(CupertinoIcons.pencil),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          width: 200,
                          height: 150,
                          child: Column(children: [
                            Text(
                              '수정하시겠습니까?',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            TextButton(
                              child: Text('예'),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PublicEditMultiPage(),
                                  ),
                                );
                              },
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('아니오'))
                          ]),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
          body: ListView.builder(
              itemCount: 4,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Column(
                    children: [
                      Text(
                        publicList[index],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => PublicEditSinglePage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(255, 135, 240, 240),
                          ),
                          padding: EdgeInsets.all(60),
                          width: double.infinity,
                          child: Text(
                            publicThingList[index].value,
                            maxLines: 10,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              })),
        );
      },
    );
  }
}
