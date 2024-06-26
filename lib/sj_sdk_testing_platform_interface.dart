import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sj_sdk_testing/model/auth_model.dart';

import 'sj_sdk_testing_method_channel.dart';

abstract class SjSdkTestingPlatform extends PlatformInterface {
  SjSdkTestingPlatform() : super(token: _token);

  static final Object _token = Object();

  static SjSdkTestingPlatform _instance = MethodChannelSjSdkTesting();

  static SjSdkTestingPlatform get instance => _instance;

  static set instance(SjSdkTestingPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> get isInitialized async {
    throw UnimplementedError('isInitialized has not been implemented.');
  }

  Future<bool> initEnvironment(String env) {
    throw UnimplementedError('initEnvironment() has not been implemented.');
  }

  Future<AuthModel> signIn() {
    throw UnimplementedError('signIn() has not been implemented.');
  }

  Future<AuthModel> signUp() {
    throw UnimplementedError('signUp() has not been implemented.');
  }

  Future<void> pointExchange() {
    throw UnimplementedError('pointExchange() has not been implemented.');
  }

  Future<void> flightRedemption(String token) {
    throw UnimplementedError('flightRedemption() has not been implemented.');
  }

  Future<Map<String, dynamic>> userProfile(String token) {
    throw UnimplementedError('userProfile() has not been implemented.');
  }
}
