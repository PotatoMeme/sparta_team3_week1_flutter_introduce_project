import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_thing.dart';
import 'public_thing_service.dart';

class PublicEditMultiPage extends StatefulWidget {
  PublicEditMultiPage({super.key, this.idx = 0});

  final int idx;

  @override
  State<PublicEditMultiPage> createState() => _PublicEditMultiPageState();
}

class _PublicEditMultiPageState extends State<PublicEditMultiPage> {
  List<TextEditingController> contentControllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    PublicThingService publicThingService = context.read<PublicThingService>();

    List<PublicThing> publicThingList = publicThingService.publicThingList;
    for (int i = 0; i < publicThingList.length; i++) {
      contentControllerList[i].text = publicThingList[i].value;
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
                  for (int i = 0; i < publicThingList.length; i++) {
                    publicThingService.updatePublicThingSingle(
                        idx: i, changed: contentControllerList[i].text);
                  }

                  Navigator.pop(context);
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
                      publicThingList[0].name,
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
                        controller: contentControllerList[0],
                        decoration: InputDecoration(
                          hintText: "우리들의 약속을 적어주세요.",
                          border: InputBorder.none,
                        ),
                        autofocus: true,
                        expands: true,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
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
                        controller: contentControllerList[1],
                        decoration: InputDecoration(
                          hintText: "추구하는 궁극적인 목표를 적어주세요",
                          border: InputBorder.none,
                        ),
                        autofocus: true,
                        expands: true,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
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
                        controller: contentControllerList[2],
                        decoration: InputDecoration(
                          hintText: "우리의 규칙 4가지를 적어주세요",
                          border: InputBorder.none,
                        ),
                        autofocus: true,
                        expands: true,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
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
                        controller: contentControllerList[3],
                        decoration: InputDecoration(
                          hintText: "우리팀만의 특징을 적어주세요",
                          border: InputBorder.none,
                        ),
                        autofocus: true,
                        expands: true,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
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
