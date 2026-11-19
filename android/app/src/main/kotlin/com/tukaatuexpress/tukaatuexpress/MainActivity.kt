package com.tukaatuexpress.tukaatuexpress

import android.content.Intent
import android.app.ActivityManager
import android.net.Uri
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channel = "tukaatu/settings"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel)
            .setMethodCallHandler { call, result ->
                if (call.method == "openNotificationSettings") {
                    val intent = Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS).apply {
                        putExtra(Settings.EXTRA_APP_PACKAGE, packageName)
                    }
                    startActivity(intent)
                    result.success(null)
                } else if (call.method == "videoMemoryInfo") {
                    val manager = getSystemService(ACTIVITY_SERVICE) as ActivityManager
                    val memory = ActivityManager.MemoryInfo()
                    manager.getMemoryInfo(memory)
                    result.success(mapOf(
                        "totalMem" to memory.totalMem,
                        "isLowRamDevice" to (manager.isLowRamDevice || memory.lowMemory)
                    ))
                } else {
                    result.notImplemented()
                }
            }
    }
}
