import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'public_edit_saveDialog.dart';

class PublicEditMultiPage extends StatefulWidget {
  const PublicEditMultiPage({super.key});

  @override
  State<PublicEditMultiPage> createState() => _PublicEditMultiPageState();
}

class _PublicEditMultiPageState extends State<PublicEditMultiPage> {
  TextEditingController contentController1 = TextEditingController();
  TextEditingController contentController2 = TextEditingController();
  TextEditingController contentController3 = TextEditingController();

  String _content1 = '';
  String _content2 = '';
  String _content3 = '';
  int count = 0;
  @override
  Widget build(BuildContext context) {
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
                showSaveConfirmationDialog(context);
              } else {
                showSaveConfirmationDialog(context);
              }
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
                    controller: contentController1,
                    decoration: InputDecoration(
                      hintText: "추구하는 궁극적인 목표를 적어주세요",
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
                    controller: contentController2,
                    decoration: InputDecoration(
                      hintText: "우리의 규칙 4가지를 적어주세요",
                      border: InputBorder.none,
                    ),
                    autofocus: true,
                    expands: true,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      _content2 = value;
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
                    controller: contentController3,
                    decoration: InputDecoration(
                      hintText: "우리팀만의 특징을 적어주세요",
                      border: InputBorder.none,
                    ),
                    autofocus: true,
                    expands: true,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      _content3 = value;
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
