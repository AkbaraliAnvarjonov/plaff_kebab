package com.example.plaff_kebab

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    MapKitFactory.setApiKey("629d4cab-58f1-4298-a7f9-31a8afa33d29") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}