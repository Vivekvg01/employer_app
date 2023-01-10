class Skill {
  Skill({
    this.skill,
  });

  String? skill;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        skill: json["skill"],
      );
}