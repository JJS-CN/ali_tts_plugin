import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ali_tts_plugin_method_channel.dart';

abstract class AliTtsPluginPlatform extends PlatformInterface {
  /// Constructs a AliAuthPluginPlatform.
  AliTtsPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static AliTtsPluginPlatform _instance = MethodChannelAliTtsPlugin();

  /// The default instance of [AliTtsPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelAliAuthPlugin].
  static AliTtsPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AliTtsPluginPlatform] when
  /// they register themselves.
  static set instance(AliTtsPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getSdkVersion() {
    throw UnimplementedError('getSdkVersion() has not been implemented.');
  }

  Future<bool> setAuthSDKInfo(String androidAppSecret, String iosAppSecret) {
    throw UnimplementedError('setAuthSDKInfo() has not been implemented.');
  }

  Future<bool> checkEnvAvailable() {
    throw UnimplementedError('checkLogin() has not been implemented.');
  }

  Future<bool> quitLoginPage() {
    throw UnimplementedError('quitLoginPage() has not been implemented.');
  }
}
