import 'package:sj_sdk_testing/model/auth_model.dart';
import 'package:sj_sdk_testing/model/sj_config.dart';

import 'sj_sdk_testing_platform_interface.dart';

class SjSdkTesting {
  SjSdkTesting._internal();

  static final SjSdkTesting instance = SjSdkTesting._internal();

  static Future<bool> init({
    required SjConfig config,
  }) async {
    final isInitSuccess = await SjSdkTestingPlatform.instance.initEnvironment(config.environment.toString());
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
