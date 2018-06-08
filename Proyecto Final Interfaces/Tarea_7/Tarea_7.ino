int out1 = 0;

void setup() {
   Serial.begin(9600);
}

void loop() {
   // LEER OIN DE ENTRADA
   out1 = analogRead(A0);
   // MUESTRA SALIDA
   Serial.println(out1);
   // RETARDO
   delay(200);
}
