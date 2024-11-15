Temperature Monitoring and Bluetooth Communication with Arduino


This project uses Arduino, an LM35 temperature sensor, a buzzer, and an HC-06 Bluetooth module to measure ambient temperature, trigger an alarm when the temperature exceeds a certain threshold, and send the temperature data to an Android device via the Serial Bluetooth Terminal app.

Project Overview
The LM35 temperature sensor measures the temperature.
When the temperature exceeds 30°C, a buzzer is activated as an alarm.
The measured temperature is transmitted to an Android device via the HC-06 Bluetooth module.
When the STOP command is given from serial, Bluetooth is silenced.


Wiring Diagram
LM35 Connections:

VCC → Arduino 5V
GND → Arduino GND
OUT → Arduino A0
HC-06 Connections:

VCC → Arduino 5V
GND → Arduino GND
TX → Arduino D2
RX → Arduino D3 (use a voltage divider to reduce the signal to 3.3V)
Buzzer Connections:

Positive lead → Arduino D8
Negative lead → Arduino GND
