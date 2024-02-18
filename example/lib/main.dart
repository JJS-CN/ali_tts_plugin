import 'package:ali_tts_plugin/ali_tts_plugin.dart';
import 'package:ali_tts_plugin/ali_tts_plugin_platform_interface.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _aliAuthPlugin = AliTtsPlugin();
  String? _sdkVersion = "";
  bool _checkEnvAvailable = false;
  String? loginToken = "";

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _aliAuthPlugin.getSdkVersion().then((value) {
      print("初始化结果：$value");
      setState(() {
        _sdkVersion = value;
      });
    });
    _aliAuthPlugin.checkEnvAvailable().then((value) {
      print("检查登录结果：$value");
      setState(() {
        _checkEnvAvailable = value;
      });
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _aliAuthPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Running on: $_platformVersion\n'),
              MaterialButton(
                onPressed: () {
                  AliTtsPluginPlatform.instance.getSdkVersion().then((value) {
                    print("初始化结果：$value");
                    setState(() {
                      _sdkVersion = value;
                    });
                  });
                },
                child: Text("sdkVersion:" + _sdkVersion.toString()),
              ),
              MaterialButton(
                onPressed: () {
                  AliTtsPluginPlatform.instance
                      .setAuthSDKInfo("androidkey", "ioskey")
                      .then((value) {});
                },
                child: Text("设置appSecret"),
              ),
              MaterialButton(
                onPressed: () {
                  AliTtsPluginPlatform.instance
                      .checkEnvAvailable()
                      .then((value) {
                    print("检查环境：$value");
                    setState(() {
                      _checkEnvAvailable = value;
                    });
                  });
                },
                child: Text("检查环境:" + _checkEnvAvailable.toString()),
              ),
              MaterialButton(
                onPressed: () {
                  print("获取登录token click");
                },
                child: Text("获取登录token:" + loginToken.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
