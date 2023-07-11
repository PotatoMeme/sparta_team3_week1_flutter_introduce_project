import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'public_thing.dart';
import 'public_thing_service.dart';

class PublicEditSinglePage extends StatefulWidget {
  const PublicEditSinglePage({super.key, required this.idx});
  final int idx;
  @override
  State<PublicEditSinglePage> createState() => _PublicEditSinglePageState();
}

class _PublicEditSinglePageState extends State<PublicEditSinglePage> {
  TextEditingController contentController = TextEditingController();
  String _content1 = '';

  @override
  Widget build(BuildContext context) {
    PublicThingService publicThingService = context.read<PublicThingService>();
    int _index = widget.idx;

    List<PublicThing> publicThingList = publicThingService.publicThingList;
    contentController.text = publicThingList[_index].value;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: false,
        title: Text(
          "약속단일수정 페이지",
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Center(
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
                publicThingList[_index].name,
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
                  controller: contentController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  autofocus: true,
                  expands: true,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    _content1 = value;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
