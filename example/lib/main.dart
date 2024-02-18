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
  final _aliTtsPlugin = AliTtsPlugin();
  String? _sdkVersion = "";
  bool _checkEnvAvailable = false;
  String? loginToken = "";

  @override
  void initState() {
    super.initState();
    _aliTtsPlugin.getTtsSdkVersion().then((value) {
      print("初始化结果：$value");
      setState(() {
        _sdkVersion = value;
      });
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
                  AliTtsPluginPlatform.instance
                      .getTtsSdkVersion()
                      .then((value) {
                    print("初始化结果：$value");
                    setState(() {
                      _sdkVersion = value;
                    });
                  });
                },
                child: Text("sdkVersion:" + _sdkVersion.toString()),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("设置appSecret"),
              ),
              MaterialButton(
                onPressed: () {},
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
