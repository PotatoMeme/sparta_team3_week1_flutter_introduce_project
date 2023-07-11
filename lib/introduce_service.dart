import 'dart:convert';

import 'human.dart';
import 'main.dart';

class IntroduceService {
  IntroduceService() {
    loadHumanList();
  }

  List<Human> humanList = [
    Human(
        name: "홍길동-1",
        posittion: "팀원",
        hobby: "독서",
        blogUrl: "https://seedpotato.tistory.com/",
        style: "저는 이러한 스타일을 가지고 있습니다",
        advantages: "저는 이러한 장점을 가지고 있습니다.",
        mbti: "AAAA",
        goal: "좋은 개발자",
        thumbUrl:
            "https://avatars.akamai.steamstatic.com/d18545996fbbc474a47e76c566c8a9ac7b09e8d0_full.jpg"), // 더미(dummy) 데이터
    Human(
        name: "홍길동-2",
        posittion: "팀원",
        hobby: "독서",
        blogUrl: "https://seedpotato.tistory.com/",
        style: "저는 이러한 스타일을 가지고 있습니다",
        advantages: "저는 이러한 장점을 가지고 있습니다.",
        mbti: "AAAA",
        goal: "좋은 개발자",
        thumbUrl:
            "https://avatars.akamai.steamstatic.com/d18545996fbbc474a47e76c566c8a9ac7b09e8d0_full.jpg"), // 더미(dummy) 데이터
    Human(
        name: "홍길동-3",
        posittion: "팀원",
        hobby: "독서",
        blogUrl: "https://seedpotato.tistory.com/",
        style: "저는 이러한 스타일을 가지고 있습니다",
        advantages: "저는 이러한 장점을 가지고 있습니다.",
        mbti: "AAAA",
        goal: "좋은 개발자",
        thumbUrl:
            "https://avatars.akamai.steamstatic.com/d18545996fbbc474a47e76c566c8a9ac7b09e8d0_full.jpg"), // 더미(dummy) 데이터
    Human(
        name: "홍길동-4",
        posittion: "팀원",
        hobby: "독서",
        blogUrl: "https://seedpotato.tistory.com/",
        style: "저는 이러한 스타일을 가지고 있습니다",
        advantages: "저는 이러한 장점을 가지고 있습니다.",
        mbti: "AAAA",
        goal: "좋은 개발자",
        thumbUrl:
            "https://avatars.akamai.steamstatic.com/d18545996fbbc474a47e76c566c8a9ac7b09e8d0_full.jpg"), // 더미(dummy) 데이터
    Human(
        name: "홍길동-5",
        posittion: "팀원",
        hobby: "독서",
        blogUrl: "https://seedpotato.tistory.com/",
        style: "저는 이러한 스타일을 가지고 있습니다",
        advantages: "저는 이러한 장점을 가지고 있습니다.",
        mbti: "AAAA",
        goal: "좋은 개발자",
        thumbUrl:
            "https://avatars.akamai.steamstatic.com/d18545996fbbc474a47e76c566c8a9ac7b09e8d0_full.jpg"), // 더미(dummy) 데이터
  ];

  createHuman({required Human human}) {
    humanList.add(human);
    saveHumanList();
  }

  updateHuman({required int index, required Human changed}) {
    humanList[index] = changed;
    saveHumanList();
  }

  deleteHuman({required int index}) {
    humanList.removeAt(index);
    saveHumanList();
  }

  saveHumanList() {
    List humanJsonList = humanList.map((human) => human.toJson()).toList();
    String jsonString = jsonEncode(humanJsonList);
    prefs.setString('humanList', jsonString);
  }

  loadHumanList() {
    String? jsonSting = prefs.getString('humanList');
    if (jsonSting == null) return;
    List humanJsonList = jsonDecode(jsonSting);
    humanList = humanJsonList.map((json) => Human.fromJson(json)).toList();
  }
}
