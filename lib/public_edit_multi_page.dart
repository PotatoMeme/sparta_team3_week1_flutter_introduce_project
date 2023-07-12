import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_thing.dart';
import 'public_page.dart';
import 'public_thing_service.dart';

class PublicEditMultiPage extends StatefulWidget {
  PublicEditMultiPage({super.key, this.idx = 0});

  final int idx;
  String _content1 = '';
  String _content2 = '';
  String _content3 = '';
  String _content4 = '';

  @override
  State<PublicEditMultiPage> createState() => _PublicEditMultiPageState();
}

class _PublicEditMultiPageState extends State<PublicEditMultiPage> {
  TextEditingController contentController1 = TextEditingController();
  TextEditingController contentController2 = TextEditingController();
  TextEditingController contentController3 = TextEditingController();
  TextEditingController contentController4 = TextEditingController();

  int count = 0;
  @override
  Widget build(BuildContext context) {
    PublicThingService publicThingService = context.read<PublicThingService>();

    List<PublicThing> publicThingList = publicThingService.publicThingList;

    contentController1.text = publicThingList[0].value;
    contentController2.text = publicThingList[1].value;
    contentController3.text = publicThingList[2].value;
    contentController4.text = publicThingList[3].value;
    widget._content1 = publicThingList[0].value;
    widget._content2 = publicThingList[1].value;
    widget._content3 = publicThingList[2].value;
    widget._content4 = publicThingList[3].value;

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
                  publicThingService.updatePublicThing(
                      changed1: widget._content1,
                      changed2: widget._content2,
                      changed3: widget._content3,
                      changed4: widget._content4);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PublicPage()),
                  );
                },
                icon: Icon(Icons.save),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black),
                        color: Colors.blue),
                    alignment: Alignment.center,
                    child: Text(
                      "우리들의 약속",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: contentController1,
                        decoration: InputDecoration(
                          hintText: "우리들의 약속을 적어주세요.",
                          border: InputBorder.none,
                        ),
                        autofocus: true,
                        expands: true,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          widget._content1 = value;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black),
                        color: Colors.blue),
                    alignment: Alignment.center,
                    child: Text(
                      "추구하는 궁극적인 목표",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: contentController2,
                        decoration: InputDecoration(
                          hintText: "추구하는 궁극적인 목표를 적어주세요",
                          border: InputBorder.none,
                        ),
                        autofocus: true,
                        expands: true,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          widget._content2 = value;
                          count++;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black),
                        color: Colors.blue),
                    alignment: Alignment.center,
                    child: Text(
                      "우리의 규칙 4가지",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: contentController3,
                        decoration: InputDecoration(
                          hintText: "우리의 규칙 4가지를 적어주세요",
                          border: InputBorder.none,
                        ),
                        autofocus: true,
                        expands: true,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          widget._content3 = value;
                          count++;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black),
                        color: Colors.blue),
                    alignment: Alignment.center,
                    child: Text(
                      "우리팀만의 특징",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: contentController4,
                        decoration: InputDecoration(
                          hintText: "우리팀만의 특징을 적어주세요",
                          border: InputBorder.none,
                        ),
                        autofocus: true,
                        expands: true,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          widget._content4 = value;
                          count++;
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
