// DECLARACION DE VARIABLES PARA PINES
const int pinecho = 8;
const int pintrigger = 9;
const int pinboc = 13;
 
// VARIABLES PARA CALCULOS
unsigned int tiempo, distancia;
 
void setup() {
// COMUNICACION SERIAL
  Serial.begin(9600);
  
// PINES DE ENTRADA Y SALIDA
  pinMode(pinecho, INPUT);
  pinMode(pintrigger, OUTPUT);
  pinMode(13, OUTPUT);
}
 
void loop() {
// PULSO DE DISPARO "TRIGGER"
  digitalWrite(pintrigger, LOW);
  delayMicroseconds(2);
  digitalWrite(pintrigger, HIGH);
// EL PULSO DURA AL MENOS 10 uS EN ESTADO ALTO
  delayMicroseconds(10);
  digitalWrite(pintrigger, LOW);
 
// MIDE EL TIEMPO EN ESTADO ALTO DEL PIN "ECHO"
// EL PULSO ES PROPORCIONAL A LA DISTANCIA MEDIDA
  tiempo = pulseIn(pinecho, HIGH);
 
// LA VEL SONIDO = 29 us POR CENTIMETRO
// T/58 (TIEMPO QUE TARDA RECORRER IDA Y VUELTA X [cm])
  distancia = tiempo / 58;
 
// ENVIAR EL RESULTADO AL MONITOR SERIAL
  Serial.print(distancia);
  Serial.println(" cm");
  delay(200);
 
  // ENCENDER EL LED CUANDO SE CUMPLA CON CIERTA DISTANCIA
  if (distancia <= 5) {
    digitalWrite(13, HIGH);
    delay(100);    
  } else {
    digitalWrite(13, LOW);
  }
}
