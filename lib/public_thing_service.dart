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
      name: "약속-1",
      value: "내용",
    ), // 더미(dummy) 데이터
    PublicThing(
      name: "약속-2",
      value: "내용",
    ), // 더미(dummy) 데이터
    PublicThing(
      name: "약속-3",
      value: "내용",
    ), // 더미(dummy) 데이터
    PublicThing(
      name: "약속-4",
      value: "내용",
    ), // 더미(dummy) 데이터
    PublicThing(
      name: "약속-5",
      value: "내용",
    ), // 더미(dummy) 데이터
  ];

  createPublicThing({required PublicThing publicThing}) {
    publicThingList.add(publicThing);
    notifyListeners();
    savePublicThingList();
  }

  updatePublicThing({required int index, required PublicThing changed}) {
    publicThingList[index] = changed;
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
