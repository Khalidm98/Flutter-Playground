# Playground

A project in which I test flutter packages before using them in real projects.

## Packages Requirements:

### add_2_calendar:
to add events without launching the calendar application (not required)<br>
add this to `android/app/src/main/AndroidManifest.xml`:
```
<manifest ...>
    <uses-permission android:name="android.permission.WRITE_CALENDAR" />
    <uses-permission android:name="android.permission.READ_CALENDAR" />
</manifest>
```
add this to `android/app/src/main/AndroidManifest.xml`:
```
<manifest ...>
    <queries>
        <intent>
            <action android:name="android.intent.action.INSERT" />
            <data android:mimeType="vnd.android.cursor.item/event" />
        </intent>
    </queries>
</manifest>
```
add this to `ios/Runner/Info.plist`:
```
	<key>NSCalendarsUsageDescription</key>
    <string>AddEventsToCalendar</string>
```

### easy_localization:
add this to `ios/Runner/Info.plist`:
```
	<key>CFBundleLocalizations</key>
    <array>
    	<string>ar</string>
    	<string>en</string>
    </array>
```
after every localization update you must generate the CodegenLoader and LocaleKeys<br>
use these commands in terminal:
```
flutter pub run easy_localization:generate -S "assets/lang" -O "lib/localizations" -o "codegen_loader.dart"
flutter pub run easy_localization:generate -S "assets/lang" -O "lib/localizations" -o "locale_keys.dart" -f keys
```

### flutter_mentions:
to detect gestures correctly when selecting a suggestion<br>
wrap the top most widget (MaterialApp, CupertinoApp, Scaffold) with Portal

### flutter_quill:
minSdkVersion must be at least 17<br>
add this to `android/app/build.gradle`:
```
android {
    defaultConfig {
        minSdkVersion 17
    }
}
```

### webview_flutter:
enable multidex<br>
minSdkVersion must be at least 19<br>
add this to `android/app/build.gradle`:
```
android {
    defaultConfig {
        minSdkVersion 19
        multiDexEnabled true
    }
}
```
