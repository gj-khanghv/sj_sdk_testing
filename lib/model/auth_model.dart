class AuthModel {
  final String accessToken;
  final String refreshToken;
  final String expiredTime;

  AuthModel({required this.accessToken, required this.refreshToken, required this.expiredTime});
}