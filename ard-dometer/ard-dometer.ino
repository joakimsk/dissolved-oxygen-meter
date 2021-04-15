#include <LiquidCrystal.h>
#include "MovingAverage.h"
MovingAverage <uint8_t, 16> filter;

LiquidCrystal lcd(8, 9, 4, 5, 6, 7);

int analogPin = A1;
int do_raw_val = -1;

void setup() {
  // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);
  // Print a message to the LCD.
  lcd.print("DO Meter");
  
  Serial.begin(9600);
}

int i = 0;
int key = 0;
int fullsaturation = 0;
int dopercentage = 0.0;

void loop() {
  do_raw_val = analogRead(analogPin);  // read the input pin
  filter.add(do_raw_val);
  key = analogRead (0);


     if (key < 60) {
       //lcd.print ("Right ");
     }
     else if (key < 200) {
       //lcd.print ("Up    ");
     }
     else if (key < 400){
      //lcd.print ("Down  ");
     }
     else if (key < 600){
      //lcd.print ("Left  ");
     }
     else if (key < 800){
       lcd.print ("Set 100%");
       fullsaturation = filter.get();
     }
   
  if (i > 40){
    lcd.clear();
    //lcd.print(filter.get());
    lcd.print("Val:");
    lcd.print(filter.get());
    
    lcd.print(" Cal:");
    lcd.print(fullsaturation);
    
    lcd.setCursor(0,1);
    lcd.print("DO:");
    lcd.print(dopercentage);
    lcd.print("%");
    //lcd.print(filter.get()/fullsaturation);

    i = 0;
  } else {
    i++;
  }
  
  dopercentage = ((float)filter.get()/  (float)fullsaturation) * 100.0;
  //Serial.println(dopercentage);
  delay(50);
}
