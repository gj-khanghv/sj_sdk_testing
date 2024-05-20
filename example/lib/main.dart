import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sj_sdk_testing/model/auth_model.dart';
import 'package:sj_sdk_testing/sj_sdk_testing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthModel? authModel;
  final _sjSdkTestingPlugin = SjSdkTesting();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    AuthModel? model;
    try {
      model =
          await _sjSdkTestingPlugin.signIn();
    } on PlatformException {
    }

    if (!mounted) return;

    setState(() {
      authModel = model;
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
              Text(authModel?.accessToken ?? ""),
              Text(authModel?.refreshToken ?? ""),
              Text(authModel?.expiredTime ?? "")
            ],
          ),
        )
      ),
    );
  }
}
