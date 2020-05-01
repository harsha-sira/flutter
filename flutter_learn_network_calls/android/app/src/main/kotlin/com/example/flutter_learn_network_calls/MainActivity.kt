package com.example.flutter_learn_network_calls

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
// import io.flutter.app.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    private val CHANNEL = "alarm"
    
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
        call, result ->
            if (call.method == "foregroundService") {
                runAlarmManager()
            }
            else {
                result.notImplemented()
            }   
        }
    }

    fun runAlarmManager() {
        ForegroundService.startService(this, "test")
    } 
}