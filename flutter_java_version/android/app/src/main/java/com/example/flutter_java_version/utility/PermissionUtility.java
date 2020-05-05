package com.example.flutter_java_version.utility;

import java.security.Permission;
import android.content.pm.PackageManager;
import androidx.core.app.ActivityCompat;
import android.Manifest;
import androidx.core.content.ContextCompat;
import android.content.Context;

import static android.Manifest.permission.ACCESS_COARSE_LOCATION;

public class PermissionUtility {

    Context context;

    public PermissionUtility(Context context) {
        this.context = context;
    }

    public void requestLocationPermissions() {

        // boolean permissionAccessCoarseLocationApproved =
        // ActivityCompat.checkSelfPermission(this,
        // permission.ACCESS_COARSE_LOCATION) == PackageManager.PERMISSION_GRANTED;

        boolean permissionAccessCoarseLocationApproved1 = ContextCompat.checkSelfPermission(context,
                Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED;
    }
}