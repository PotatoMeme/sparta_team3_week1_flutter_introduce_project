import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class IntroduceEditPage extends StatelessWidget {
  const IntroduceEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          "소개 수정 페이지",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
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
                width: 350,
                height: 30,
                margin: EdgeInsets.all(3),
                child: TextField(),
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
                width: 350,
                height: 30,
                margin: EdgeInsets.all(3),
                child: TextField(),
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
                width: 350,
                height: 30,
                margin: EdgeInsets.all(3),
                child: TextField(),
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
                width: 350,
                height: 30,
                margin: EdgeInsets.all(3),
                child: TextField(),
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
                width: 350,
                height: 30,
                margin: EdgeInsets.all(3),
                child: TextField(),
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
                width: 350,
                height: 30,
                margin: EdgeInsets.all(3),
                child: TextField(),
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
                width: 350,
                height: 30,
                margin: EdgeInsets.all(3),
                child: TextField(),
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
                width: 350,
                height: 30,
                margin: EdgeInsets.all(3),
                child: TextField(),
              ),
              Text(
                "프로필사진",
              ),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                  ),
                  width: 350,
                  height: 300,
                  margin: EdgeInsets.all(3),
                  child: Image.network(
                      'https://img1.daumcdn.net/thumb/C428x428/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Ftistory_admin%2Fstatic%2Fmanage%2Fimages%2Fr3%2Fdefault_L.png')),
            ],
          ),
        ),
      ),
    );
  }
}
