package com.example.sj_sdk_testing

import android.app.Activity
import android.content.Intent
import android.util.Log
import io.flutter.plugin.common.PluginRegistry
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodChannel.Result
import loy.mobile.android_sdk_testing.AndroidSDK
import java.util.HashMap

/** SjSdkTestingPlugin */
class SjSdkTestingPlugin: FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var activity: android.app.Activity? = null
  private lateinit var androidSDK: AndroidSDK
  private var _result: Result? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "sj_sdk_testing")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    _result = result
    when (call.method) {
      "initEnv" -> {
        val env = call.argument<String>("env") ?: ""
        androidSDK = AndroidSDK(env = env)
        result.success(true)
      }
      "isInit" -> {
        result.success(::androidSDK.isInitialized)
      }
      "signIn" -> {
        androidSDK.signIn(activity)
      }
      "signUp" -> {
        androidSDK.signUp(activity)
      }
      else -> result.success("else")
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(activityPluginBinding: ActivityPluginBinding) {
    // TODO: your plugin is now attached to an Activity
    this.activity = activityPluginBinding.getActivity()
    activityPluginBinding.addActivityResultListener(this)
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null
  }

  override fun onReattachedToActivityForConfigChanges(activityPluginBinding: ActivityPluginBinding) {
    this.activity = activityPluginBinding.getActivity()
    activityPluginBinding.addActivityResultListener(this)
  }

  override fun onDetachedFromActivity() {
    activity = null
  }

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
    Log.d("AAAA", "Message Received")
    if (resultCode == 200) {
      val map = HashMap<String, String>()
      map["token"] = data?.getStringExtra("token") ?: ""
      map["refreshToken"] = data?.getStringExtra("refreshToken") ?: ""
      map["expired"] = data?.getStringExtra("expired") ?: ""
      Log.d("AAAA", "Token: ${map["token"]}")
      _result?.success(map)
      return true
    }
    return false
  }
}
