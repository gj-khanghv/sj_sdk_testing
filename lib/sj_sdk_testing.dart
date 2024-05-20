import 'package:sj_sdk_testing/model/auth_model.dart';

import 'sj_sdk_testing_platform_interface.dart';

enum Environment { dev, stg, uat, prod }

class SjSdkTesting {
  /// Provide your targeted environment: dev, stg, uat (default), prod
  final Environment env;

  SjSdkTesting({
    this.env = Environment.uat,
  });

  /// Sign in flow
  Future<AuthModel> signIn() {
    return SjSdkTestingPlatform.instance.signIn();
  }

  /// Sign up flow
  Future<AuthModel> signUp() {
    return SjSdkTestingPlatform.instance.signUp();
  }
}
