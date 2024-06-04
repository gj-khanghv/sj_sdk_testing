enum Environment {
  dev("dev"),
  stg("stg"),
  uat("uat"),
  prod("prod");

  final String name;

  const Environment(this.name);
}

enum Language { en, vn }

class SjConfig {
  final Environment environment;
  final Language language;
  final String clientId;

  SjConfig({
    required this.clientId,
    this.language = Language.vn,
    this.environment = Environment.uat,
  });
}
