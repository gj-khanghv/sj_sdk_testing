import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sj_sdk_testing/model/auth_model.dart';

import 'sj_sdk_testing_platform_interface.dart';

class MethodChannelSjSdkTesting extends SjSdkTestingPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('sj_sdk_testing');

  @override
  Future<bool> get isInitialized async {
    return await methodChannel.invokeMethod<bool>('isInit') ?? false;
  }

  @override
  Future<bool> initEnvironment(String env) async {
    return await methodChannel.invokeMethod<bool>('initEnv', {
      "env": env,
    }) ?? false;
  }

  @override
  Future<AuthModel> signIn() async {
    final map = await methodChannel.invokeMethod<Map>('signIn');
    return AuthModel(
      accessToken: map?['token'] ?? "",
      refreshToken: map?['refreshToken'] ?? "",
      expiredTime: map?['expired'] ?? "",
    );
  }

  @override
  Future<AuthModel> signUp() async {
    final map = await methodChannel.invokeMethod<Map>('signUp');
    return AuthModel(
      accessToken: map?['token'] ?? "",
      refreshToken: map?['refreshToken'] ?? "",
      expiredTime: map?['expired'] ?? "",
    );
  }

  @override
  Future<void> pointExchange() async {
    await methodChannel.invokeMethod('pointExchange');
  }

  @override
  Future<void> flightRedemption(String token) async {
    await methodChannel.invokeMethod('flightRedemption', {
      "token": token,
    });
  }
}
