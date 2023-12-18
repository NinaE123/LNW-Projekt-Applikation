/* TO DO LIST:

 Schritt 1
 Fehleranzeigen für alle anpassen. Gemacht:)
 Ellipsenfarbe transparent machen. Gemacht:)
 
 Schritt 2
 Fehler Anzahl, welche noch zu finden ist. Gemacht:)
 
 Schritt 3
 Einführung ins Spiel schreiben und darstellen: Gemacht:)
 Button um Spiel zu Starten.                     Design!
 (Effekte einbauen, zb, Zeit/Timer)              Gemacht:)
 
 Schritt 4
 Schlussbutton, wenn alle 10 Fehler gefunden wurden. Gemacht:)
 Titel fett.
 Kleeblatt oder ähnliches einfügen.
 Optional: Fehlerbild mit schönem weissen Rand verzieren.
 Lob und Effekt
 
 Schritt 5
 Code kürzen, verbessern
 -> Mit einer Liste Arbeiten:
 1. Booleans sind per Definition als falsch gesetzt. (https://www.youtube.com/watch?v=l0gGOxyvZQI)
 2. Für x,y und r wurde eine je eine Liste erstellt, welche aus 10 Werten besteht wegen den 10 Fehlern. Die Werte werden wieder wie zuvor in der
 Funktion definiert. Einfach dass wir jetzt die Liste durchlaufen lassen können und die Fehler markiert werden.
 */


PImage fehlerbild;
PImage kleeblatt;

int[] x = new int[10];                      //erstellt die Liste mit den X-Koordinaten der Fehler, welche 10 Werte gross ist.
int[] y = new int[10];                      //erstellt die Liste mit den Y-Koordinaten der Fehler, welche 10 Werte gross ist.
int[] r = new int[10];                      //erstellt die Liste mit den Radius-Werten der Fehler, welche 10 Werte gross ist.
boolean [] fehler = new boolean[10];        //erstellt eine boolean Liste mit den Fehlern, welche per Definition am Anfang alle auf false gestellt sind.

//String kx, ky;                              //Die Strings kx und ky wurden nur zur Bestimmung der Position der Maus benutzt, um die Fehler zu markieren. Kann also aus dem Code gelöscht werden.
String tofind;

int find;                                    //Anzahl zu suchende Fehler als Integer.

int starttime = 0;
int stopTime;

boolean stopTimeSaved = false;

boolean gameStarted = false;                 // Definiert, wann das Spiel starten soll
boolean endGame = false;




void setup() {
  size(620, 808);
  fehlerbild = loadImage("Fehlerbild_ohne_Kreise.png");                    //lädt das Fehlerbild ins Programm hoch.            
  kleeblatt = loadImage("kleeblatt.png");                                  //lädt das Kleeblattbildchen ins Programm hoch. 
  //kx = "";                                                               //Die Strings kx und ky wurden nur zur Bestimmung der Position der Maus benutzt, um die Fehler zu markieren. Kann also aus dem Code gelöscht werden.
  //ky = "";
}

void draw() {
  background(255);
  Spielbeschreibung();
  image(kleeblatt, 245, 425, 140, 140);
  if (!gameStarted) {
    displayStartButton();
  } else {
    image(fehlerbild, 10, 10, 600, 788);
    rahmen();
    fehlerkennzeichnung();
    spiegelzentrum();
  }
  Spielende();
}

void Spielbeschreibung() {
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Spielbeschreibung Fehlerbild:", 310, 185);
  textSize(16);
  text("Finde 10 Fehler im Bild durch Punktspiegelung im unteren Feld.", 310, 230);
  text("Das Spiegelzentrum ist mit Z beschriftet.", 310, 260);
  text("Klickst du auf einen richtigen Fehler, erscheint ein grüner Kreis.", 310, 290);
  text("Die verbleibende Anzahl Fehler siehst du in der Mitte.", 310, 320);
  text("Klickst du auf Start, so beginnt das Spiel und die Zeit läuft.", 310, 350);
  text("Viel Erfolg!", 310, 380);
  
  //Titel unterstreichen
  strokeWeight(3);
  stroke(178, 223, 238);
  line(170, 203, 450, 203);
  
  
  //Verzierung oben rechts.
  strokeWeight(2);
  line(610, 8, 610, 50);
  line(605, 13, 605, 40);
  line(590, 13, 605, 13);
  line(583, 8, 610, 8);

  //Verzierung unten links.
  line(10, 756, 10, 798);
  line(10, 798, 37, 798);
  line(15, 793, 15, 766);
  line(15, 793, 30, 793);
}

void displayStartButton() {
  strokeWeight(3);
  stroke(0);
  fill(178, 223, 238);                // Bläuliche Farbe
  rect(210, 600, 200, 50, 20);
  fill(0);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Start", 310, 625);
}

void mousePressed() {
  if (!gameStarted) {
    if (mouseX > 205 && mouseX < 415 && mouseY > 595 && mouseY < 655) {
      gameStarted = true;
      starttime = millis();
    }
  }
}

/**  Mit Hilfe dieser Funktion wurden die Fehlerkoordinaten in eine Tabelle herausgeschrieben.
     Könnte also aus dem Code gelöscht werden.
     
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
 

//Bestimmt, wo die Fehler zu finden sind und wie sie gekennzeichnet werden, falls gefunden.
void fehlerkennzeichnung() {
  x[0] = 406;        //In diesem Block werden alle X-Koordinaten der Fehler 1-10 in die Liste abgespeichert.
  x[1] = 201;
  x[2] = 66;
  x[3] = 251;
  x[4] = 525;
  x[5] = 545;
  x[6] = 39;
  x[7] = 335;
  x[8] = 402;
  x[9] = 277;

  y[0] = 765;        //In diesem Block werden alle Y-Koordinaten der Fehler 1-10 in die Liste abgespeichert.
  y[1] = 628;
  y[2] = 465;
  y[3] = 454;
  y[4] = 461;
  y[5] = 661;
  y[6] = 705;
  y[7] = 488;
  y[8] = 566;
  y[9] = 571;

  r[0] = 25;        //In diesem Block werden alle Radien der Fehler 1-10 in die Liste abgespeichert.
  r[1] = 22;
  r[2] = 18;
  r[3] = 18;
  r[4] = 23;
  r[5] = 21;
  r[6] = 19;
  r[7] = 19;
  r[8] = 29;
  r[9] = 23;

  int find = 10;

  /* mit Alphawert um die Ellipse transparent zu machen. Füllung ist transparenter (125) als die Aussenlinie (200)*/
  fill(0, 153, 0, 125);
  strokeWeight(1);
  stroke(0, 153, 0, 200);


  /*Misst die Distanz der Maus zu den Fehlerzentren. Wenn die Maus näher als der zum Fehler passende Radius ist, und geklickt wird, dann wird die Ellipse um den Fehler gezeichnet und er gilt als gefunden.*/
  /*In jedem Drawvorgang werden die Stellen 1-10 gleichzeitig durchgegangen und verglichen (Beschreibung eher ungenau). */
  
  for (int i = 0; i < 10; i++) {
    if ((dist(x[i], y[i], mouseX, mouseY) < r[i]) && (mousePressed)) {
      fehler[i] = true;
    }
    if (fehler[i] == true) {
      ellipse(x[i], y[i], 2*r[i], 2*r[i]);
      find -= 1;
    }
  }

  if (find == 0) {
    endGame = true;
  }

  String tofind = Integer.toString(find);
  fill(0);
  textSize(22);
  textAlign(LEFT, CENTER);
  text("Zu suchende Fehler: " + tofind, 18, 404);
}

void spiegelzentrum() {
  fill(255);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(310, 404, 15, 15);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(12);
  text("Z", 310, 404);
}

void Spielende() {
  if (endGame == true) {
    if (stopTimeSaved == false ) {        //Dieses "if" wird nur einmal ausgeführt. Weil: Wird der Code in der Klammer ausgeführt? Ja oder Nein: 
      stopTimeSaved = true;
      stopTime = millis();
    }
    fill(255);
    stroke(178, 223, 238);
    strokeWeight(5);
    rect(110, 150, 400, 150, 20);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Glückwunsch, du hast alle Fehler gefunden :)", 310, 210);
    textSize(18);
    text("Zeit: " + nf((stopTime- starttime)/1000) + " s", 310, 240);
    text("Spiel beendet", 310, 350);
  }
}

void rahmen() {
  stroke(255);
  fill(255);
  rect(0, 0, 18, 808);
  rect(593, 0, 27, 808);
  rect(0, 0, 620, 15);
  rect(0, 791, 620, 17);
  rect(0, 387, 620, 34);
}
