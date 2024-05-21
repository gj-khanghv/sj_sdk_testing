enum Environment { dev, stg, uat, prod }

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
