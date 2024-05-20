// import 'package:flutter_test/flutter_test.dart';
// import 'package:sj_sdk_testing/sj_sdk_testing.dart';
// import 'package:sj_sdk_testing/sj_sdk_testing_platform_interface.dart';
// import 'package:sj_sdk_testing/sj_sdk_testing_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockSjSdkTestingPlatform
//     with MockPlatformInterfaceMixin
//     implements SjSdkTestingPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final SjSdkTestingPlatform initialPlatform = SjSdkTestingPlatform.instance;
//
//   test('$MethodChannelSjSdkTesting is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelSjSdkTesting>());
//   });
//
//   test('getPlatformVersion', () async {
//     SjSdkTesting sjSdkTestingPlugin = SjSdkTesting();
//     MockSjSdkTestingPlatform fakePlatform = MockSjSdkTestingPlatform();
//     SjSdkTestingPlatform.instance = fakePlatform;
//
//   });
// }
