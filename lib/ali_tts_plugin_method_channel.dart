import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../ali_tts_plugin_platform_interface.dart';

/// An implementation of [AliTtsPluginPlatform] that uses method channels.
class MethodChannelAliTtsPlugin extends AliTtsPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ali_tts_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getSdkVersion() async {
    final version = await methodChannel.invokeMethod<String?>('getSdkVersion');
    return version;
  }

  @override
  Future<bool> setAuthSDKInfo(
      String androidAppSecret, String iosAppSecret) async {
    final setAuthSDKInfo = await methodChannel.invokeMethod<bool>(
        'setAuthSDKInfo',
        {"androidAppSecret": androidAppSecret, "iosAppSecret": iosAppSecret});
    return setAuthSDKInfo ?? false;
  }

  @override
  Future<bool> checkEnvAvailable() async {
    final checkEnvAvailable =
        await methodChannel.invokeMethod<bool>('checkEnvAvailable');
    return checkEnvAvailable ?? false;
  }

  @override
  Future<bool> quitLoginPage() async {
    final quitLoginPage =
        await methodChannel.invokeMethod<bool>('quitLoginPage');
    return quitLoginPage ?? false;
  }
}
