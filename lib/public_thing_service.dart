import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sparta_team3_week1_flutter_introduce_project/public_thing.dart';

import 'main.dart';

class PublicThingService extends ChangeNotifier {
  PublicThingService() {
    //service 생성시 shared experience에 접근하여 저장된값을 불러옴
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
    //공공객체 생성
    publicThingList.add(publicThing); //리스트에 값을 추가
    notifyListeners(); //화면최신화
    savePublicThingList(); //리스트안의 데이이터들을 shared experience에저장
  }

  updatePublicThing({required int idx, required String changed}) {
    //공공객체 수정
    publicThingList[idx].value = changed; //최산값을 해당 index에 집어넣어 변경
    notifyListeners(); //화면최신화
    savePublicThingList(); //리스트안의 데이이터들을 shared experience에저장
  }

  deletePublicThing({required int index}) {
    //공공객체 삭제
    publicThingList.removeAt(index); //해당 index의 값을 삭제
    notifyListeners(); //화면최신화
    savePublicThingList(); //리스트안의 데이이터들을 shared experience에저장
  }

  savePublicThingList() {
    //현재값들을 shared experience에 저장하는 함수
    List publicThingJsonList = publicThingList
        .map((publicThing) => publicThing.toJson())
        .toList(); //publicThingList를 돌면서 PublicThing형태의 현재객체를 map형태로 변경하고 그결과를 list로 변경하여 결과적으로는 List<Map>형태로 만듬
    String jsonString = jsonEncode(
        publicThingJsonList); //jsonEncode함수로 List<Map>형태의 값을  문자열형태의 json으로 만들어버림
    prefs.setString('publicThingList',
        jsonString); //shared experience에 publicThingList라는이름으로 json을 저장
  }

  loadPublicThingList() {
    //shared experience에서 저장되어있는 publicThingList를 불러오는 함수
    String? jsonSting = prefs.getString(
        'publicThingList'); //shared experience에 publicThingList라는이름의 문자열을 불러옴
    if (jsonSting == null) return; //해당값이 없다면 함수를 종료
    List publicThingJsonList =
        jsonDecode(jsonSting); //jsonString이라는 문자열을 디코드하여 List<Map>형태로변경
    publicThingList = publicThingJsonList
        .map((json) => PublicThing.fromJson(json))
        .toList(); //List<Map>형태의 humanJsonList를 변환하여 List<PublicThing>형태로 변경해줌
  }
}
