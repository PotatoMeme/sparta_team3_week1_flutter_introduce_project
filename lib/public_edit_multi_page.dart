import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_thing.dart';
import 'public_edit_saveDialog.dart';
import 'public_thing_service.dart';

class PublicEditMultiPage extends StatefulWidget {
  PublicEditMultiPage({super.key, this.idx = 0});

  final int idx; // public_page에서 넘어온 인덱스값 사용 x

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

  bool multiSingle = true; // saveDialog에서 single_page와 multi_page를 구분하기 위한 변수
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
              "Edit Page 'Team'",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  showSaveConfirmationDialog(
                      context, contentControllerList, widget.idx, multiSingle);
                },
                child: Icon(
                  CupertinoIcons.floppy_disk,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
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
                        controller: contentControllerList[index],
                        decoration: InputDecoration(
                          hintText: "입력을 해주세요",
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
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
