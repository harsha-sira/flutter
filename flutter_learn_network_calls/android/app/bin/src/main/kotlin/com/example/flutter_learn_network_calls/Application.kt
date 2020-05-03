// package com.example.flutter_learn_network_calls

// import io.flutter.app.FlutterApplication
// import io.flutter.plugin.common.PluginRegistry
// import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
// import io.flutter.plugins.pathprovider.PathProviderPlugin
// import com.tekartik.sqflite.SqflitePlugin
// import io.flutter.view.FlutterMain
// import rekab.app.background_locator.LocatorService
// import android.content.Context
// import android.content.ContextWrapper
// import android.content.Intent
// import android.content.IntentFilter
// import android.os.BatteryManager
// import android.os.Build.VERSION
// import android.os.Build.VERSION_CODES
// import org.thebus.foreground_service.ForegroundServicePlugin

// class Application : FlutterApplication(), PluginRegistrantCallback {

//     private val CHANNEL = "alarm"

//     override fun onCreate() {
//         super.onCreate()
//         LocatorService.setPluginRegistrant(this)
//         FlutterMain.startInitialization(this)
//     }

//     override fun registerWith(registry: PluginRegistry?) {
//         if (!registry!!.hasPlugin("io.flutter.plugins.pathprovider")) {
//             PathProviderPlugin.registerWith(registry!!.registrarFor("io.flutter.plugins.pathprovider"))
//         }
//         if (!registry!!.hasPlugin("com.tekartik.sqflite")) {
//             SqflitePlugin.registerWith(registry!!.registrarFor("com.tekartik.sqflite"))
//         }
//         // if (!registry!!.hasPlugin("org.thebus.foreground_service.ForegroundServicePlugin")) {
//             ForegroundServicePlugin.registerWith(registry!!.registrarFor("org.thebus.foreground_service.ForegroundServicePlugin"))
//         // }
//         // ForegroundServicePlugin.registerWith(p0.registrarFor("org.thebus.foreground_service.ForegroundServicePlugin"))
//     }

//     override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//     MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {

//     call, result ->
//     if (call.method == "foregroundService") {
//         runAlarmManager()
//     }
//     }
//     }


//     fun runAlarmManager() {
//         ForegroundService.startService(this)
//         // Log.d("TAG", "Alarm Manager Android ....")
//         if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
//             // val alarmManager =
//             //     context.getSystemService(Context.ALARM_SERVICE) as? AlarmManager
//             // val pendingIntent =
//             //     PendingIntent.getService(context, requestId, intent,
//             //                                 PendingIntent.FLAG_NO_CREATE)
//             // alarmManager.set(clock, startMillis, pendingIntent);
            

//         } else {
//             // val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
//             // batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
//         }
//     }   
// }