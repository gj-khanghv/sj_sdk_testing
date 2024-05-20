import 'package:sj_sdk_testing/model/auth_model.dart';

import 'sj_sdk_testing_platform_interface.dart';

enum Environment { dev, stg, uat, prod }

class SjSdkTesting {
  SjSdkTesting._internal();

  static final SjSdkTesting instance = SjSdkTesting._internal();

  static Future<bool> init({
    Environment env = Environment.uat,
  }) async {
    final isInitSuccess = await SjSdkTestingPlatform.instance.initEnvironment(env.toString());
    return isInitSuccess;
  }

  /// Sign in flow
  Future<AuthModel> signIn() async {
    assert(
      await SjSdkTestingPlatform.instance.isInitialized,
      "Please call SjSdkTesting.init() before using this method",
    );
    return SjSdkTestingPlatform.instance.signIn();
  }

  /// Sign up flow
  Future<AuthModel> signUp() async {
    assert(
      await SjSdkTestingPlatform.instance.isInitialized,
      "Please call SjSdkTesting.init() before using this method",
    );
    return SjSdkTestingPlatform.instance.signUp();
  }
}
