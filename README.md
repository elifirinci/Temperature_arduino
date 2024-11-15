Temperature Monitoring and Bluetooth Communication with Arduino


This project uses Arduino, an LM35 temperature sensor, a buzzer, and an HC-06 Bluetooth module to measure ambient temperature, trigger an alarm when the temperature exceeds a certain threshold, and send the temperature data to an Android device via the Serial Bluetooth Terminal app.

Project Overview
The LM35 temperature sensor measures the temperature.
When the temperature exceeds 30°C, a buzzer is activated as an alarm.
The measured temperature is transmitted to an Android device via the HC-06 Bluetooth module.
When the STOP command is given from serial, Bluetooth is silenced.
