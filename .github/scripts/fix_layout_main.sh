#!/bin/bash
XML_FILE="app/src/main/res/layout/activity_main.xml"
JAVA_FILE="app/src/main/java/com/aurora/launcher/MainActivity.java"

echo "🔧 Corrigindo layout e MainActivity..."

if [ -f "$XML_FILE" ]; then
cat > "$XML_FILE" <<XMLEND
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@drawable/nova_aurora_background"
    android:orientation="vertical"
    android:gravity="center">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="vertical"
        android:gravity="center"
        android:padding="24dp">

        <TextView
            android:id="@+id/title"
            android:text="Nova Aurora Roleplay"
            android:textSize="26sp"
            android:textColor="#FFFFFF"
            android:layout_marginBottom="24dp"
            android:textStyle="bold" />

        <Button
            android:id="@+id/btn_jogar"
            android:text="Entrar no Servidor"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:backgroundTint="#FF7A00"
            android:textColor="#FFFFFF"
            android:layout_marginBottom="12dp" />

        <Button
            android:id="@+id/btn_config"
            android:text="Configurações"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:backgroundTint="#333333"
            android:textColor="#FFFFFF" />

    </LinearLayout>
</RelativeLayout>
XMLEND
echo "✅ Layout recriado com sucesso!"
else
echo "⚠️ Layout não encontrado: \$XML_FILE"
fi

if [ -f "$JAVA_FILE" ]; then
cat > "$JAVA_FILE" <<JAVAEND
package com.aurora.launcher;

import android.app.Activity;
import android.os.Bundle;
import android.widget.Button;
import android.widget.Toast;
import android.content.Intent;
import android.net.Uri;

public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button btnJogar = findViewById(R.id.btn_jogar);
        Button btnConfig = findViewById(R.id.btn_config);

        btnJogar.setOnClickListener(v -> {
            Toast.makeText(this, "Conectando ao servidor Nova Aurora...", Toast.LENGTH_SHORT).show();
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("samp://188.165.192.24:5644"));
            startActivity(intent);
        });

        btnConfig.setOnClickListener(v -> {
            Toast.makeText(this, "Em breve: configurações!", Toast.LENGTH_SHORT).show();
        });
    }
}
JAVAEND
echo "✅ MainActivity corrigida com sucesso!"
else
echo "⚠️ Arquivo Java não encontrado: \$JAVA_FILE"
fi

echo "🏁 Correção finalizada!"

