import '../ali_tts_plugin_platform_interface.dart';

class AliTtsPlugin {
  Future<String?> getPlatformVersion() {
    return AliTtsPluginPlatform.instance.getPlatformVersion();
  }

  Future<String?> getSdkVersion() {
    return AliTtsPluginPlatform.instance.getSdkVersion();
  }

  Future<bool> setAuthSDKInfo(String androidAppSecret, String iosAppSecret) {
    return AliTtsPluginPlatform.instance
        .setAuthSDKInfo(androidAppSecret, iosAppSecret);
  }

  Future<bool> checkEnvAvailable() {
    return AliTtsPluginPlatform.instance.checkEnvAvailable();
  }

  Future<bool> quitLoginPage() {
    return AliTtsPluginPlatform.instance.quitLoginPage();
  }
}
