class PublicThing {
  PublicThing({
    this.name = "",
    this.value = "",
  });

  String name; // 값 이름
  String value; // 내용

  Map toJson() {
    //현재값을 map으로 변환
    return {
      "name": name,
      "value": value,
    };
  }

  factory PublicThing.fromJson(json) {
    //map값을 이용하여 객체를 생성
    return PublicThing(
      name: json["name"],
      value: json["value"],
    );
  }
}
