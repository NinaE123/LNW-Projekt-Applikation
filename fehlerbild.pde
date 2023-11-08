/* TO DO LIST:
 ausarbeiten, danach Schritt für Schritt abarbeiten.
 Schritt 1
 Fehleranzeigen für alle anpassen. Gemacht:)
 Ellipsenfarbe transparent machen. Gemacht:)
 
 Schritt 2
 Fehler Anzahl, welche noch zu finden ist. Gemacht:) 
 
 Schritt 3
 Einführung ins Spiel schreiben und darstellen
 Button um Spiel zu Starten. 
 (Effekte einbauen, zb, Zeit/Timer)
 
 Schritt 4
 Schlussbutton, wenn alle 10 Fehler gefunden wurden. 
 Lob und Effekt
 
 Schritt 5
 Code kürzen, verbessern
 */

PImage fehlerbild;
boolean fehler_1 = false;
boolean fehler1, fehler2, fehler3, fehler4, fehler5, fehler6, fehler7, fehler8, fehler9, fehler10 = false;
float x;
float y;

String kx, ky;
String tofind;

/* x-y Koordinaten und Radien der Fehler*/
int x1, x2, x3, x4, x5, x6, x7, x8, x9, x10;
int y1, y2, y3, y4, y5, y6, y7, y8, y9, y10;
int r1, r2, r3, r4, r5, r6, r7, r8, r9, r10;
int find;


void setup() {
  size(620, 808);
  fehlerbild = loadImage("fehlerbild_mit_Kreisen.png");
  kx = "";
  ky = "";
}

void draw() {
  background(255);
  image(fehlerbild, 10, 10, 600, 788);
  f_1();
  fehlerkennzeichnung();
}

/**  Mit Hilfe dieser Funktion wurden die Fehlerkoordinaten in eine Tabelle herausgeschrieben.
void mouseposition() {
  x = mouseX;
  y = mouseY;
  String kx = Float.toString(x);
  String ky = Float.toString(y);
  textSize(32);
  strokeWeight(32);
  text(kx, 200, 50);
  text(ky, 400, 50);
}
Folgender Befehl wurde in den draw geschrieben.
mouseposition(); **/

void f_1() {
  if (fehler_1 == true) {
    ellipse(mouseX, mouseY, 20, 40);
    stroke(255, 0, 0);
    strokeWeight(5);
    noFill();
  }
}

void fehlerkennzeichnung() {
  int x1 = 406;
  int x2 = 201;
  int x3 = 66;
  int x4 = 251;
  int x5 = 525;
  int x6 = 545;
  int x7 = 39;
  int x8 = 335;
  int x9 = 402;
  int x10 = 277;

  int y1 = 768;
  int y2 = 628;
  int y3 = 465;
  int y4 = 454;
  int y5 = 461;
  int y6 = 661;
  int y7 = 705;
  int y8 = 488;
  int y9 = 566;
  int y10 = 571;

  int r1 = 25;
  int r2 = 22;
  int r3 = 18;
  int r4 = 18;
  int r5 = 23;
  int r6 = 21;
  int r7 = 19;
  int r8 = 19;
  int r9 = 29;
  int r10 = 23;
  
  int find = 10;

/* mit Alphawert um die Ellipse transparent zu machen*/
    fill(0, 153, 0, 125);
    strokeWeight(1);
    stroke(0,153,0, 200);
    
    
/*Ellipse um Fehler 1*/
  if ((dist(x1, y1, mouseX, mouseY) < r1) && (mousePressed)) {
    fehler1 = true;
  }
  if (fehler1 == true) {
    ellipse(x1, y1, 2*r1, 2*r1);
    find -= 1;
  }
  
/*Ellipse um Fehler 2*/
  if ((dist(x2, y2, mouseX, mouseY) < r2) && (mousePressed)) {
    fehler2 = true;
  }
  if (fehler2 == true) {
    ellipse(x2, y2, 2*r2, 2*r2);
    find -= 1;
  }
   
/*Ellipse um Fehler 3*/
  if ((dist(x3, y3, mouseX, mouseY) < r3) && (mousePressed)) {
    fehler3 = true;
  }
  if (fehler3 == true) {
    ellipse(x3, y3, 2*r3, 2*r3);
    find -= 1;
  }
  
/*Ellipse um Fehler 4*/
  if ((dist(x4, y4, mouseX, mouseY) < r4) && (mousePressed)) {
    fehler4 = true;
  }
  if (fehler4 == true) {
    ellipse(x4, y4, 2*r4, 2*r4);
    find -= 1;
  }
 
 /*Ellipse um Fehler 5*/
  if ((dist(x5, y5, mouseX, mouseY) < r5) && (mousePressed)) {
    fehler5 = true;
  }
  if (fehler5 == true) {
    ellipse(x5, y5, 2*r5, 2*r5);
    find -= 1;
  }
  
/*Ellipse um Fehler 6*/
  if ((dist(x6, y6, mouseX, mouseY) < r6) && (mousePressed)) {
    fehler6 = true;
  }
  if (fehler6 == true) {
    ellipse(x6, y6, 2*r6, 2*r6);
    find -= 1;
  }
  
/*Ellipse um Fehler 7*/
  if ((dist(x7, y7, mouseX, mouseY) < r7) && (mousePressed)) {
    fehler7 = true;
  }
  if (fehler7 == true) {
    ellipse(x7, y7, 2*r7, 2*r7);
    find -= 1;
  }
  
/*Ellipse um Fehler 8*/
  if ((dist(x8, y8, mouseX, mouseY) < r8) && (mousePressed)) {
    fehler8 = true;
  }
  if (fehler8 == true) {
    ellipse(x8, y8, 2*r8, 2*r8);
    find -= 1;
  }
  
/*Ellipse um Fehler 9*/
  if ((dist(x9, y9, mouseX, mouseY) < r9) && (mousePressed)) {
    fehler9 = true;
  }
  if (fehler9 == true) {
    ellipse(x9, y9, 2*r9, 2*r9);
    find -= 1;
  }
  
/*Ellipse um Fehler 10*/
  if ((dist(x10, y10, mouseX, mouseY) < r10) && (mousePressed)) {
    fehler10 = true;
  }
  if (fehler10 == true) {
    ellipse(x10, y10, 2*r10, 2*r10);
    find -= 1;
    }
   
    String tofind = Integer.toString(find);
    fill(0);
    textSize(22);
    text("Zu suchende Fehler: " + tofind,200,412);
    
  }
