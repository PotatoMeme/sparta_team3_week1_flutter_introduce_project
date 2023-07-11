class PublicThing {
  PublicThing({
    this.name = "",
    this.value = "",
  });

  String name; // 값 이름
  String value; // 내용

  Map toJson() {
    return {
      "name": name,
      "publicThing": value,
    };
  }

  factory PublicThing.fromJson(json) {
    return PublicThing(
      name: json["name"],
      value: json["value"],
    );
  }
}
