boolean[][] arena =  new boolean[80][60];
int[][] vecinos = new int[80][60];
void setup() {
  size(801, 601);
  fill(0);
  //sortear();
  glider();
  spaceship();
}
void draw() {
  background(255);
  contarVecinos();
  siguienteGeneracion();
  dibujar();
  delay(150);
}
void glider(){
  arena[30][40] = true;
  arena[31][40] = true;
  arena[32][40] = true;
  arena[30][41] = true;


  
  arena[31][42] = true;
}
void spaceship(){
  arena[10][40] = true;
  arena[13][40] = true;
  arena[14][41] = true;
  arena[10][42] = true;
  arena[14][42] = true;
  arena[11][43] = true;
  arena[12][43] = true;
  arena[13][43] = true;
  arena[14][43] = true;
}
void sortear() {
  for (int i = 0; i <80; i++) {
    for (int j = 0; j < 60; j++) {
      if (random(1) < 0.5) {
        arena[i][j] = false;
      } else {
        arena[i][j] = true;
      }
    }
  }
}
void dibujar() {
  for (int i = 0; i <80; i++) {
    for (int j = 0; j < 60; j++) {
      if (arena[i][j]) {
        ellipse(i*10+5, j*10+5, 10, 10);
      }
    }
  }
}
void contarVecinos() {  
  for (int i = 1; i <79; i++) {
    for (int j = 1; j < 59; j++) {
      int ctd = 0;
      if (arena[i-1][j]){ctd++;}
      if (arena[i-1][j-1]){ctd++;}
      if (arena[i][j-1]){ctd++;}
      if (arena[i+1][j-1]){ctd++;}
      if (arena[i+1][j]){ctd++;}
      if (arena[i+1][j+1]){ctd++;}
      if (arena[i][j+1]){ctd++;}
      if (arena[i-1][j+1]){ctd++;}
      vecinos[i][j] = ctd;
    }
  }  
}
void siguienteGeneracion(){
  for (int i = 0; i <80; i++) {
    for (int j = 0; j < 60; j++) {
      if (arena[i][j] && vecinos[i][j] > 3 || vecinos[i][j] < 2){
        arena[i][j] = false;
      }
      if (!arena[i][j] && vecinos[i][j] == 3){
        arena[i][j] = true;
      }
    }
  }
}
