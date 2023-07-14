import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'human.dart';
import 'main.dart';

class IntroduceService extends ChangeNotifier {
  IntroduceService() {
    //service 생성시 shared experience에 접근하여 저장된값을 불러옴
    loadHumanList();
  }

  List<Human> humanList = [
    Human(
        name: "박성수",
        posittion: "팀장",
        hobby: "게임, 드라마감상",
        blogUrl: "https://23-06-21.tistory.com/",
        style:
            "- 저는 계획을 세우고 문제를 최대한 빠르게 해결하는 스타일입니다. \n- 인간관계 있어서 트러블이 생기면 최대한 원만하게 해결하려 합니다.",
        advantages: "- 낯가림이 별로 없습니다.\n- 다른사람의 말을 잘 들어준다.",
        mbti: "ESFJ",
        goal:
            "- 최대한 코드와 친해져서 제스타일로 앱도 만들어 보고 \n서로서로 협업하면서 발생하는 대화에 적극적으로 참여 하기. \n- 익숙해졌을때쯤 좋은 회사의 구성원이 되기",
        thumbUrl:
            "https://github.com/seongssu/ImageUrl/blob/main/httpsibb.cokXbkQsJ.png?raw=true"), // 더미(dummy) 데이터
    Human(
        name: "김성환",
        posittion: "팀원",
        hobby: "독서,영화감상",
        blogUrl: "https://seedpotato.tistory.com/",
        style:
            "- 서로의견을 나누며 프로잭트의 기획 하는것을 중요하게생각합니다. \n- 프로잭트중 이상한곳이있다면 얘기해주세요!",
        advantages:
            "- 저는 탐구심이 많은것이 장점입니다. \n- 그래서 궁금하거나 모르는게 있다면 \n시간이 지나더라도 꼭찾아보는 편입니다.",
        mbti: "INFP",
        goal: "- 매일매일 성장해나가는 개발자",
        thumbUrl:
            "https://github.com/seongssu/ImageUrl/blob/main/%EA%B9%80%EC%84%B1%ED%99%98.jpg?raw=true"), // 더미(dummy) 데이터
    Human(
        name: "조원준",
        posittion: "팀원",
        hobby: "독서, 게임",
        blogUrl: "https://seedpotato.tistory.com/",
        style:
            "- 문제가 생겼을 때 우선 혼자서 시도를 해보고 해결이 되지 않을 경우 다른 사람들과 소통을 하여 문제를 해결합니다.",
        advantages: "- 저는 남들의 의견을 잘 들어서 남들과 소통을 원활하게 할 수 있는 것이 장점입니다.",
        mbti: "ISTJ",
        goal: "- 기본기가 튼튼한 개발자",
        thumbUrl:
            "https://github.com/seongssu/ImageUrl/blob/main/%EC%A1%B0%EC%9B%90%EC%A4%80.jpg?raw=true"), // 더미(dummy) 데이터
    Human(
        name: "허다겸",
        posittion: "팀원",
        hobby: "캘리그라피",
        blogUrl: "https://consult777.tistory.com/",
        style: "- 나만의 스타일은 아직 없고, 주변에 잘 물듭니다.",
        advantages: "- 책임감이있고 감성적이다.",
        mbti: "INFJ",
        goal: "- 혼자 메모장 만들어 보기 \n- 좋은 개발자",
        thumbUrl:
            "https://github.com/seongssu/ImageUrl/blob/main/%ED%97%88%EB%8B%A4%EA%B2%B8.jpg?raw=true"), // 더미(dummy) 데이터
    Human(
        name: "서정한",
        posittion: "팀원",
        hobby: "독서",
        blogUrl: "https://velog.io/@seojh5939",
        style:
            "- 깔끔하게 코드를 짜고싶어하고 잘 정돈되있는것을 좋아합니다. \n- 무슨일이든 의도를 중요하게 생각합니다. \n- 나만이 아닌 모두가 잘되는것에 관심이 있습니다.",
        advantages: "- 맡겨진 일을 성실하게 기한에 맞춰 해냅니다. \n- 포기하지않고 주어진 문제를 끝까지 해결해냅니다.",
        mbti: "ISTJ",
        goal:
            "- 안드로이드 Framework에 익숙해져서 \n모든 문제를 주먹구구식으로라도 풀 수 있도록 만들기 \n- DI, 디자인페턴을 익히고 직접 구현해보기 \n- 교육기간 배우고 느낀것들을 꾸준히 기록하기 \n- 위의 내용을 가지고 사용자들의 실생활에 도움이 되는 제품을 \n만들어가는 회사에 취업하기",
        thumbUrl:
            "https://avatars.githubusercontent.com/u/76927858?s=400&u=26a9df53072b4e7c18c5325fc3e52e08f9517644&v=4"), // 더미(dummy) 데이터
  ];

  createHuman({required Human human}) {
    //소개생성
    humanList.add(human); //리스트에 값을 추가
    notifyListeners(); //화면최신화
    saveHumanList(); //리스트안의 데이이터들을 shared experience에저장
  }

  updateHuman({required int index, required Human changed}) {
    //소개수정
    humanList[index] = changed; //최산값을 해당 index에 집어넣어 변경
    notifyListeners(); //화면최신화
    saveHumanList(); //리스트안의 데이이터들을 shared experience에저장
  }

  deleteHuman({required int index}) {
    //소개삭제
    humanList.removeAt(index); //해당 index의 값을 삭제
    notifyListeners(); //화면최신화
    saveHumanList(); //리스트안의 데이이터들을 shared experience에저장
  }

  saveHumanList() {
    //현재값들을 shared experience에 저장하는 함수
    List humanJsonList = humanList
        .map((human) => human.toJson())
        .toList(); //humanList를 돌면서 Human형태의 현재객체를 map형태로 변경하고 그결과를 list로 변경하여 결과적으로는 List<Map>형태로 만듬
    String jsonString = jsonEncode(
        humanJsonList); //jsonEncode함수로 List<Map>형태의 값을  문자열형태의 json으로 만들어버림
    prefs.setString(
        'humanList', jsonString); //shared experience에 humanList라는이름으로 json을 저장
  }

  loadHumanList() {
    //shared experience에서 저장되어있는 humanList를 불러오는 함수
    String? jsonString = prefs
        .getString('humanList'); //shared experience에 humanList라는이름의 문자열을 불러옴
    if (jsonString == null) return; //해당값이 없다면 함수를 종료
    List humanJsonList =
        jsonDecode(jsonString); //jsonString이라는 문자열을 디코드하여 List<Map>형태로변경
    humanList = humanJsonList
        .map((json) => Human.fromJson(json))
        .toList(); //List<Map>형태의 humanJsonList를 변환하여 List<Human>형태로 변경해줌
  }
}
