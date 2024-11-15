#include <SoftwareSerial.h>

// Bluetooth RX ve TX pinleri
SoftwareSerial bluetooth(2, 3); // RX, TX Arduino tarafında

// Pin tanımları
const int buzzerPin = 8;
const int lm35Pin = A0;

// Sıcaklık limiti
const float tempLimit = 30.0;

// Buzzer durumu için bir bayrak
bool buzzerActive = true;

void setup() {
  // Seri iletişim başlat
  Serial.begin(9600);         // Arduino'ya bağlanmak için
  bluetooth.begin(9600);      // Bluetooth seri haberleşmesini başlat

  // Pin modlarını ayarla
  pinMode(buzzerPin, OUTPUT);
  digitalWrite(buzzerPin, LOW); // Buzzer başlangıçta kapalı

  // Başlangıç mesajları
  Serial.println("HC-06 Bluetooth Başlatıldı");
  bluetooth.println("Bluetooth Modülü Çalışıyor...");
}

void loop() {
  // LM35'ten sıcaklık değerini oku
  int analogValue = analogRead(lm35Pin);
  float voltage = analogValue * (5.0 / 1023.0); // Voltajı hesapla
  float temperature = voltage * 100.0;         // Sıcaklığı hesapla (LM35)

  // Bluetooth üzerinden komutları kontrol et
  if (bluetooth.available()) {
    String command = bluetooth.readStringUntil('\n'); // Komutu oku
    command.trim(); // Fazla boşlukları kaldır

    if (command.equalsIgnoreCase("STOP")) {
      buzzerActive = false; // Buzzer'ı devre dışı bırak
      bluetooth.println("Buzzer Durduruldu.");
      digitalWrite(buzzerPin, LOW); // Buzzer kapalı
    } else if (command.equalsIgnoreCase("START")) {
      buzzerActive = true; // Buzzer'ı tekrar aktif et
      bluetooth.println("Buzzer Aktif.");
    }
  }

  // Sıcaklık değeri 30°C'nin üstünde ise buzzer'ı kontrol et
  if (temperature > tempLimit && buzzerActive) {
    digitalWrite(buzzerPin, HIGH); // Buzzer açık
    bluetooth.println("!!! Sıcaklık Yüksek !!!");
  } else {
    digitalWrite(buzzerPin, LOW); // Buzzer kapalı
  }

  // Sıcaklık değerini Bluetooth üzerinden gönder
  bluetooth.print("Sıcaklık: ");
  bluetooth.print(temperature);
  bluetooth.println(" C");

  // Seri monitöre de yazdır
  Serial.print("Sıcaklık: ");
  Serial.print(temperature);
  Serial.println(" C");

  // 1 saniye bekle
  delay(1000);
}
