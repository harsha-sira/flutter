package com.example.flutter_java_version;

import androidx.core.content.ContextCompat;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugins.GeneratedPluginRegistrant;
import com.example.flutter_java_version.utility.PermissionUtility;

import java.security.Permission;
import android.content.pm.PackageManager;
import androidx.core.app.ActivityCompat;
import android.Manifest;
import androidx.core.content.ContextCompat;
import android.content.Context;

public class MainActivity extends FlutterActivity {

  private static final String BATTERY_CHANNEL = "samples.flutter.io/battery";
  private static final String SEVICE_CHANNEL = "samples.flutter.io/service";

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);

    new MethodChannel(flutterEngine.getDartExecutor(), BATTERY_CHANNEL).setMethodCallHandler(new MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("getBatteryLevel")) {
          int batteryLevel = getBatteryLevel();

          if (batteryLevel != -1) {
            result.success(batteryLevel);
          } else {
            result.error("UNAVAILABLE", "Battery level not available.", null);
          }
        } else if (call.method.equals("foreground")) {

          Intent serviceIntent = new Intent(getActivity(), ForegroundService.class);
          serviceIntent.putExtra("inputExtra", "Foreground Service Example in Android");
          ContextCompat.startForegroundService(getActivity(), serviceIntent);

          result.success("Run Service Success");
        } else {
          result.notImplemented();
        }
      }
    });

    new MethodChannel(flutterEngine.getDartExecutor(), SEVICE_CHANNEL).setMethodCallHandler(new MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("foregroundService")) {
          Intent serviceIntent = new Intent(getActivity(), ForegroundService.class);
          serviceIntent.putExtra("inputExtra", "Foreground Service Example in Android");
          ContextCompat.startForegroundService(getActivity(), serviceIntent);

          result.success("Run Service Success");
        } else if (call.method.equals("permissions")) {

          // PermissionUtility utility = new
          // PermissionUtility(getActivity().getApplicationContext());
          // utility.requestLocationPermissions();
          // boolean permissionAccessCoarseLocationApproved1 =
          // ContextCompat.checkSelfPermission(getApplicationContext(),
          // Manifest.permission.ACCESS_FINE_LOCATION) !=
          // PackageManager.PERMISSION_GRANTED;

          // boolean permissionAccessCoarseLocationApproved =
          // ActivityCompat.checkSelfPermission(getActivity(),
          // Manifest.permission.ACCESS_COARSE_LOCATION) ==
          // PackageManager.PERMISSION_GRANTED;

          result.success("Permission Success");
        } else {
          result.notImplemented();
        }
      }
    });

  }

  private int getBatteryLevel() {
    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
      BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
      return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
    } else {
      Intent intent = new ContextWrapper(getApplicationContext()).registerReceiver(null,
          new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
      return (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100)
          / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
    }
  }
}
