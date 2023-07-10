import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/introduce_page.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 216, 151),
      appBar: AppBar(
        title: Text("메인 페이지"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/board.png',
                    fit: BoxFit.fitWidth,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PublicPage()),
                      );
                    },
                    child: Text(
                      "우리팀의 약속\n팀설명\n우리 팀만의 특징\n추구하는 궁극적인 목표\n",
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ),
                ],
              ),
            ),
            // Stack(
            //   alignment: Alignment.center,
            //   children: [
            //     Image.asset(
            //       'assets/images/conference_table.jpeg',
            //     ),
            //     Column(
            //       children: [
            //         Column(
            //           children: [
            //             Container(
            //               alignment: Alignment.topCenter,
            //               width: 100,
            //               height: 100,
            //               decoration: BoxDecoration(
            //                 image: DecorationImage(
            //                   image: AssetImage('assets/images/smile.png'),
            //                 ),
            //               ),
            //               child: Text("박성수"),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //     Row(
            //       children: [
            //         Column(
            //           children: [
            //             Column(
            //               children: [
            //                 Container(
            //                   alignment: Alignment.topCenter,
            //                   width: 100,
            //                   height: 100,
            //                   decoration: BoxDecoration(
            //                     image: DecorationImage(
            //                       image: AssetImage('assets/images/smile.png'),
            //                     ),
            //                   ),
            //                   child: Text("박성수"),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //         Column(
            //           children: [
            //             Column(
            //               children: [
            //                 Container(
            //                   alignment: Alignment.topCenter,
            //                   width: 100,
            //                   height: 100,
            //                   decoration: BoxDecoration(
            //                     image: DecorationImage(
            //                       image: AssetImage('assets/images/smile.png'),
            //                     ),
            //                   ),
            //                   child: Text("박성수"),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            // OutlinedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (_) => IntroducePage()),
            //     );
            //   },
            //   child: Text("소개페이지로 이동"),
            // ),
            // OutlinedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (_) => PublicPage()),
            //     );
            //   },
            //   child: Text("공공페이지로 이동"),
            // ),
          ],
        ),
      ),
    );
  }
}
