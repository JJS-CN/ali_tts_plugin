import 'dart:collection';

import '../ali_tts_plugin_platform_interface.dart';

class AliTtsPlugin {
  Future<String?> getTtsSdkVersion() {
    return AliTtsPluginPlatform.instance.getTtsSdkVersion();
  }

  Future<String?> getTransSdkVersion() {
    return AliTtsPluginPlatform.instance.getTransSdkVersion();
  }

  Future<bool> setTtsParams(HashMap<String, Object> info) {
    return AliTtsPluginPlatform.instance.setTtsParams(info);
  }

  Future<bool> ttsPlay(HashMap<String, Object> info) {
    return AliTtsPluginPlatform.instance.ttsPlay(info);
  }

  Future<bool> ttsCancel() {
    return AliTtsPluginPlatform.instance.ttsCancel();
  }
}
