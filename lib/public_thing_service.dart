import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_thing.dart';

import 'main.dart';

class PublicThingService extends ChangeNotifier {
  PublicThingService() {
    loadPublicThingList();
  }

  List<PublicThing> publicThingList = [
    PublicThing(
      name: "우리의 약속",
      value: "내용1",
    ), // 더미(dummy) 데이터
    PublicThing(
      name: "추구하는 궁극적인 목표",
      value: "내용2",
    ), // 더미(dummy) 데이터
    PublicThing(
      name: "우리의 규칙",
      value: "내용3",
    ), // 더미(dummy) 데이터
    PublicThing(
      name: "우리팀만의 특징",
      value: "내용4",
    ), // 더미(dummy) 데이터
  ];

  createPublicThing({required PublicThing publicThing}) {
    publicThingList.add(publicThing);
    notifyListeners();
    savePublicThingList();
  }

  updatePublicThing(
      {required String changed1,
      required String changed2,
      required String changed3,
      required String changed4}) {
    publicThingList[0].value = changed1;
    publicThingList[1].value = changed2;
    publicThingList[2].value = changed3;
    publicThingList[3].value = changed4;
    notifyListeners();
    savePublicThingList();
  }

  deletePublicThing({required int index}) {
    publicThingList.removeAt(index);
    notifyListeners();
    savePublicThingList();
  }

  savePublicThingList() {
    List publicThingJsonList =
        publicThingList.map((publicThing) => publicThing.toJson()).toList();
    String jsonString = jsonEncode(publicThingJsonList);
    prefs.setString('publicThingList', jsonString);
  }

  loadPublicThingList() {
    String? jsonSting = prefs.getString('publicThingList');
    if (jsonSting == null) return;
    List publicThingJsonList = jsonDecode(jsonSting);
    publicThingList =
        publicThingJsonList.map((json) => PublicThing.fromJson(json)).toList();
  }
}
