import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_thing.dart';
import 'public_page.dart';
import 'public_thing_service.dart';

class PublicEditMultiPage extends StatefulWidget {
  PublicEditMultiPage({super.key, this.idx = 0});

  final int idx;

  @override
  State<PublicEditMultiPage> createState() => _PublicEditMultiPageState();
}

class _PublicEditMultiPageState extends State<PublicEditMultiPage> {
  TextEditingController contentController1 = TextEditingController();

  String _content1 = '';
  String _content2 = '';
  String _content3 = '';
  String _content4 = '';
  int count = 0;
  @override
  Widget build(BuildContext context) {
    PublicThingService publicThingService = context.read<PublicThingService>();
    int _index = widget.idx;

    List<PublicThing> publicThingList = publicThingService.publicThingList;

    for (int i = 0; i < 4; i++) {
      contentController1.text = publicThingList[i].value;
    }

    return Consumer<PublicThingService>(
      builder: (context, publicThingService, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: false,
            title: Text(
              "약속멀티수정 페이지",
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  if (count > 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PublicPage()),
                    );
                  } else {
                    AlertDialog(
                      title: Text('경고'),
                      content: Text('내용변경을 하지 않았습니다.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('닫기'),
                        ),
                      ],
                    );
                  }
                },
                icon: Icon(Icons.save),
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
                      publicThingList[index].name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromARGB(255, 135, 240, 240),
                      ),
                      padding: EdgeInsets.all(60),
                      width: double.infinity,
                      child: TextField(
                        controller: contentController1,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
