package org.cl.flutter.firebaseml

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.util.Log
import androidx.annotation.NonNull
import com.google.firebase.ml.vision.FirebaseVision
import com.google.firebase.ml.vision.cloud.FirebaseVisionCloudDetectorOptions
import com.google.firebase.ml.vision.common.FirebaseVisionImage
import com.google.firebase.ml.vision.common.FirebaseVisionImageMetadata
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

//import devrel.firebase.google.com.firebaseoptions.BuildConfig

class MainActivity: FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/battery"
    private val CHANNEL_L = "samples.flutter.dev/landmark"
    val options = FirebaseVisionCloudDetectorOptions.Builder()
            .setModelType(FirebaseVisionCloudDetectorOptions.LATEST_MODEL)
            .setMaxResults(15)
            .build()

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            // Note: this method is invoked on the main thread.
            call, result ->
            if (call.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel()

                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_L).setMethodCallHandler {
            // Note: this method is invoked on the main thread.
            call, result ->
            if (call.method == "landmark") {
                Log.v("TAG", call.arguments.toString())
                var file = File(call.arguments.toString())

                var fileExists = file.exists()
                Log.v("TAG", "existe archivo:$fileExists")
                if (fileExists) {
                    val detector = FirebaseVision.getInstance().getVisionCloudLandmarkDetector(options)
                    val bitmap: Bitmap = BitmapFactory.decodeFile(file.path)
                    val myImage = FirebaseVisionImage.fromBitmap(bitmap)
                    val result = detector.detectInImage(myImage)
                            .addOnSuccessListener { firebaseVisionCloudLandmarks ->
                                // Task completed successfully
                                // [START_EXCLUDE]
                                // [START get_landmarks_cloud]
                                var resultAux:List<String> = mutableListOf<String>()
                                for (landmark in firebaseVisionCloudLandmarks) {

                                    val bounds = landmark.boundingBox
                                    val landmarkName = landmark.landmark
                                    val entityId = landmark.entityId
                                    val confidence = landmark.confidence
                                    Log.v("TAG", "landmark: $landmarkName")
                                    // Multiple locations are possible, e.g., the location of the depicted
                                    // landmark and the location the picture was taken.
                                    var latitude:Double = 0.0
                                    var longitude:Double = 0.0
                                    for (loc in landmark.locations) {
                                        latitude = loc.latitude
                                        longitude = loc.longitude
                                        Log.v("TAG", "location: $latitude,$longitude")
                                    }
                                    resultAux += "{\"landmark\":\"$landmarkName\",\"latitude\":\"$latitude\",\"longitude\":\"$longitude\"}"
                                }
                                // [END get_landmarks_cloud]
                                // [END_EXCLUDE]
                                result.success(resultAux)
                            }
                            .addOnFailureListener { e ->
                                // Task failed with an exception
                                // ...
                                result.error("UNAVAILABLE", "Battery level not available.", null)
                            }
                }
            } else {
                result.notImplemented()
            }
        }
    }


    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }
        return batteryLevel
    }

}

