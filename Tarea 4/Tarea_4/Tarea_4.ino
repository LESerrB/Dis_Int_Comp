//Universidad Nacional Autonoma de México, Nombre, Apellidos #cta
#include <LiquidCrystal.h>          // Libreria de LCD
LiquidCrystal lcd(1, 2,4, 5, 6, 7); // RS, ENABLE, D4, D5, D6, D7
void setup() {
  lcd.begin(16,2);                  // LCD DE 16X2
  lcd.clear();
  lcd.setCursor(1,0);
  lcd.print("HOLA KARLA!!!!!");
  lcd.setCursor(0,1);
  lcd.print("MIRA MI TAREA =)");
}

void loop() {
  lcd.setCursor(16,1);
  lcd.autoscroll();
  lcd.print(" ");
  delay(400);
}
