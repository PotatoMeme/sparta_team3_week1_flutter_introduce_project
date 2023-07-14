class Human {
  Human({
    this.name = "",
    this.posittion = "",
    this.hobby = "",
    this.blogUrl = "",
    this.style = "",
    this.advantages = "",
    this.mbti = "",
    this.goal = "",
    this.thumbUrl = "",
  });

  String name = ""; // 이름
  String posittion = ""; // 직책
  String hobby = ""; // 취미및 특기
  String blogUrl = ""; // 블로그 url
  String style = ""; // 자신의 스타일 협업 스타일 소개
  String advantages = ""; // 장점
  String mbti = ""; // mbti
  String goal = ""; // 목표
  String thumbUrl = ""; // 프로필사진 이미지url

  Map toJson() {
    //현재값을 map으로 변환
    return {
      "name": name,
      "posittion": posittion,
      "hobby": hobby,
      "blogUrl": blogUrl,
      "style": style,
      "advantages": advantages,
      "mbti": mbti,
      "goal": goal,
      "thumbUrl": thumbUrl
    };
  }

  factory Human.fromJson(json) {
    //map값을 이용하여 객체를 생성
    return Human(
      name: json['name'],
      posittion: json["posittion"],
      hobby: json["hobby"],
      blogUrl: json["blogUrl"],
      style: json["style"],
      advantages: json["advantages"],
      mbti: json["mbti"],
      goal: json["goal"],
      thumbUrl: json["thumbUrl"],
    );
  }
}
