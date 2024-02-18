import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../ali_tts_plugin_platform_interface.dart';

/// An implementation of [AliTtsPluginPlatform] that uses method channels.
class MethodChannelAliTtsPlugin extends AliTtsPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final ttsChannel = const MethodChannel('ChatTtsChannel');
  @visibleForTesting
  final transChannel = const MethodChannel('ChatTransChannel');

  @override
  Future<String?> getTransSdkVersion() async {
    final version = await ttsChannel.invokeMethod<String>('getTransSdkVersion');
    return version;
  }

  @override
  Future<String?> getTtsSdkVersion() async {
    final version = await ttsChannel.invokeMethod<String?>('getTtsSdkVersion');
    return version;
  }

  @override
  Future<bool> setTtsParams(Map<String, dynamic> info) async {
    await ttsChannel.invokeMethod('setTtsParams', info);
    return true;
  }

  @override
  Future<bool> ttsPlay(Map<String, dynamic> info) async {
    await ttsChannel.invokeMethod('ttsPlay', info);
    return true;
  }

  @override
  Future<bool> ttsCancel() async {
    await ttsChannel.invokeMethod<bool>('ttsCancel');
    return true;
  }
}
