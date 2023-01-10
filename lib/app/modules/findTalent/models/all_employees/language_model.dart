 class Language {
  Language({
    this.language,
  });

  String? language;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        language: json["language"],
      );
}