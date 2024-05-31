#include <SoftwareSerial.h>

SoftwareSerial bluetooth(0, 1); // RX, TX

int redPin = 9;
int greenPin = 10;
int bluePin = 11;

void setup() {
  Serial.begin(9600);
  bluetooth.begin(9600);
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
}

void loop() {
  if (bluetooth.available()) {
    char command = bluetooth.read();
    Serial.print("Received command: ");
    Serial.println(command); // Imprimir el comando recibido
    if (command == 'R') {
      int value = bluetooth.parseInt();
      Serial.print("Red value: ");
      Serial.println(value); // Imprimir el valor para el LED rojo
      analogWrite(redPin, value);
    } else if (command == 'G') {
      int value = bluetooth.parseInt();
      Serial.print("Green value: ");
      Serial.println(value); // Imprimir el valor para el LED verde
      analogWrite(greenPin, value);
    } else if (command == 'B') {
      int value = bluetooth.parseInt();
      Serial.print("Blue value: ");
      Serial.println(value); // Imprimir el valor para el LED azul
      analogWrite(bluePin, value);
    } else if (command == 'F') {
      Serial.println("Turning off all LEDs"); // Imprimir mensaje de apagado
      analogWrite(redPin, 0);
      analogWrite(greenPin, 0);
      analogWrite(bluePin, 0);
    }
  }
}
