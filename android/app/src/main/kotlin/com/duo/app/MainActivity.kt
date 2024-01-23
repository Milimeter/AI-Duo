package com.duo.app

import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity: FlutterFragmentActivity() {
   init {
        System.loadLibrary("TrustWalletCore")
    }
}
