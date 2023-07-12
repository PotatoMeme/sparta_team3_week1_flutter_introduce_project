import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'public_edit_saveDialog.dart';
import 'public_thing.dart';
import 'public_thing_service.dart';

class PublicEditSinglePage extends StatefulWidget {
  const PublicEditSinglePage({super.key, required this.idx});
  final int idx;
  @override
  State<PublicEditSinglePage> createState() => _PublicEditSinglePageState();
}

class _PublicEditSinglePageState extends State<PublicEditSinglePage> {
  List<TextEditingController> contentControllerList = [TextEditingController()];

  int count = 1;

  @override
  Widget build(BuildContext context) {
    PublicThingService publicThingService = context.read<PublicThingService>();
    int index = widget.idx;

    List<PublicThing> publicThingList = publicThingService.publicThingList;
    contentControllerList[0].text = publicThingList[index].value;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: false,
        title: Text(
          "약속단일수정 페이지",
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
                  context, contentControllerList, widget.idx, count);
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                publicThingList[index].name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 135, 240, 240),
                ),
                padding: EdgeInsets.all(60),
                width: double.infinity,
                child: TextField(
                  controller: contentControllerList[0],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  autofocus: true,
                  keyboardType: TextInputType.multiline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
