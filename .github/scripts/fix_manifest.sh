#!/bin/bash
echo "🔧 Corrigindo AndroidManifest.xml e namespace..."

MANIFEST="app/src/main/AndroidManifest.xml"
GRADLE="app/build.gradle"

# Corrigir o AndroidManifest.xml
cat > "$MANIFEST" <<XMLEND
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <application
        android:label="@string/app_name"
        android:icon="@mipmap/ic_launcher"
        android:allowBackup="true"
        android:theme="@style/Theme.AppCompat.Light.NoActionBar">

        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>

    </application>

</manifest>
XMLEND

# Corrigir o namespace no build.gradle
if grep -q "namespace" "$GRADLE"; then
  sed -i "s/namespace .*/namespace com.aurora.launcher/" "$GRADLE"
else
  sed -i "/android {/a \    namespace com.aurora.launcher" "$GRADLE"
fi

echo "✅ Correção concluída!"

