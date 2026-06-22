# ArtPeriod Android Build & Installation Guide

This document explains how the Android APK for ArtPeriod was generated, how to build it again, and how to install it on a device.

---

## 1. APK Files Location
After a successful build, your APK files are located in the following folders:

*   **Release APK (Signed):**  
    `app/build/outputs/apk/release/app-release.apk`  
    *Use this for sharing or uploading to the Play Store.*
*   **Debug APK:**  
    `app/build/outputs/apk/debug/app-debug.apk`  
    *Use this for quick local testing.*

---

## 2. Signing Configuration
To create a "working" release APK, the app must be signed. I have already configured this for you:

*   **Keystore File:** `app/my-release-key.jks`
*   **Configuration:** Managed in `gradle.properties` and `app/build.gradle`.
*   **Default Credentials:**
    *   **Store Password:** `password123`
    *   **Key Alias:** `my-key-alias`
    *   **Key Password:** `password123`

> **Note:** If you plan to publish to the Google Play Store, you should keep the `.jks` file safe and eventually update the passwords to something more secure in `gradle.properties`.

---

## 3. How to Build Again
If you make changes to your code and want to generate a new APK, follow these steps:

### From Android Studio:
1.  Open the **Gradle** tab on the right side.
2.  Navigate to `android > app > Tasks > build`.
3.  Double-click `assembleRelease` (for the final version) or `assembleDebug` (for testing).

### From Command Line:
Run this command in the `android/` folder:
```bash
./gradlew assembleRelease
```

---

## 4. How to Install on Your Phone (Manual Method)
Since you chose to install manually, follow these steps:

1.  **Connect your phone** to your computer via USB.
2.  On the phone, change the USB mode to **"File Transfer"**.
3.  **Copy** `app-release.apk` from your computer to your phone's storage (e.g., the Downloads folder).
4.  On your phone, use a **File Manager** app to find the APK.
5.  **Tap the APK** to install it.
    *   *Note: You may see a warning about "Unknown Apps". You will need to click "Settings" and "Allow from this source" to proceed.*

---

## 5. Maintenance Tips
*   **Capacitor Sync:** If you change your web code (HTML/JS/CSS), remember to run `npx cap sync` in your main project folder before building the Android project.
*   **Version Code:** To update the app on a phone that already has it, you must increase the `versionCode` in `app/build.gradle`.
