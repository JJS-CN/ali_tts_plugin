package com.example.ali_tts_plugin

import androidx.annotation.NonNull
import android.graphics.Color
import android.content.Context
import android.util.Log

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import org.json.JSONObject

import com.alibaba.idst.nui.CommonUtils
import com.alibaba.idst.nui.Constants
import com.alibaba.idst.nui.INativeTtsCallback
import com.alibaba.idst.nui.NativeNui

/** AliTtsPlugin */
class AliTtsPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var ttsChannel: MethodChannel
    private lateinit var tansChannel: MethodChannel
    private lateinit var context: Context
    var nui_tts_instance: NativeNui = NativeNui(Constants.ModeType.MODE_TTS)

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        ttsChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "ChatTtsChannel")
        ttsChannel.setMethodCallHandler(this)
        tansChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "ChatTransChannel")
        tansChannel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getTtsSdkVersion") {
            val version: String = nui_tts_instance.GetVersion()
            result.success(version)
        } else if (call.method == "getTransSdkVersion") {
        } else if (call.method == "initTtsSDk") {
        } else if (call.method == "setTtsParams") {
        } else if (call.method == "ttsPlay") {
        } else if (call.method == "ttsCancel") {
        } else if (call.method == "initTransSDk") {
        } else if (call.method == "setTransParams") {
        } else if (call.method == "startTrans") {
        } else if (call.method == "cancelTrans") {
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        ttsChannel.setMethodCallHandler(null)
        tansChannel.setMethodCallHandler(null)
    }
}
