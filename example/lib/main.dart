import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sj_sdk_testing/model/auth_model.dart';
import 'package:sj_sdk_testing/model/sj_config.dart';
import 'package:sj_sdk_testing/sj_sdk_testing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SjSdkTesting.init(config: SjConfig(clientId: '', environment: Environment.stg));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthModel? authModel;
  Map<String, dynamic>? user;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    AuthModel? model;
    Map<String, dynamic>? user;
    try {
      model =
          await SjSdkTesting.instance.signIn();
      user = await SjSdkTesting.instance.userProfile(model.accessToken);
    } on PlatformException {
      //ignore
    }

    if (!mounted) return;

    setState(() {
      authModel = model;
      user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Text(authModel?.accessToken ?? ""),
              // Text(authModel?.refreshToken ?? ""),
              // Text(authModel?.expiredTime ?? "")
              Text(user?["fullName"] ?? "")
            ],
          ),
        )
      ),
    );
  }
}
