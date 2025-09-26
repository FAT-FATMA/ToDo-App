class ProfModeel {
  String? name;
  String? username;
  int? experience;
  String? level;

  ProfModeel({this.name, this.username, this.experience, this.level});

  ProfModeel.fromJson(Map<String, dynamic> json) {
    name = json['displayName'];
    username = json['username'];
    experience = json['experienceYears'];
    level = json['level'];
  }
}

