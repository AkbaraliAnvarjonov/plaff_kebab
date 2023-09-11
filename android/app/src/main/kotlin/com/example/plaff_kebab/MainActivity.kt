package com.example.plaff_kebab

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    MapKitFactory.setApiKey("d9b0f53f-48f0-4fe4-a270-b9f953109f85") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}