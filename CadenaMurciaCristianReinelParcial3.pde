import javax.swing.JOptionPane;

PFont fuente;
float v1;
float r1;
float r2;
float i;
float vr1;
float vr2;


void setup() {
  size(400,400); 
  fuente = createFont("Mukti Narrow Bold",40);
  v1 = 12;
  r1 = 10;
  r2 = 10;
}

void draw() { 
  
  background(#B9B9B0);
  
  //TituloPrincipal
  textSize(44);
  fill(0,0,0);
  textAlign(CENTER);
  textFont(fuente);
  text("LEY DE OHM",200,50);
  
  //Subtitulo
  textSize(18);
  fill(#41a7e6);
  textAlign(CENTER);
  text("Haga click sobre una resistencia o",200,80);
  text("la fuente, para cambiar su valor",190,100);
  
  
  //CALCULOS
  i = calcularIntensidad(v1,r1,r2);
  vr1 = calcularVr1(i,r1);
  vr2 = calcularVr2(i,r2);
  

  
  
  //FUENTE DE VOLTAJE
  
  //V1
  textSize(14);
  fill(0);
  text(""+nfs(v1,0,1)+"v",60,267);  
  
  //RectanguloFuenteDeVoltaje

  fill(#CECCCC);
  stroke(0);
  rect(55,200,45,45);
  
  //simbolofuentedevoltajeDCArriba
  stroke(0);
  line(77,220,77,210);
  stroke(0);
  line(60,220,95,220);
  
  //simbolofuentedevoltajeDCAbajo
  stroke(0);
  line(70,226,84,226);
  stroke(0);
  line(77,226,77,238);
  
  //lineaPositivaVerticalhaciaR1
  stroke(#37B44E);
  line(77,199,77,155);
  
  //lineaPositivaHorizontalhaciaR1
  stroke(#37B44E);
  line(77,155,130,155);
  
  
  //RESISTENCIA 1 R1
  
  //r1
  textSize(14);
  fill(0);
  text("R1 = "+nfs(r1,0,1)+" KOhm",170,185);  
  
  //vr1
  textSize(16);
  fill(#D38C1A);
  text("+  "+nfs(vr1,0,1)+" V -",152,135);  
  
  //Rectangulo R1
  
  fill(255, 255, 0);
  stroke(0);
  rect(130,142,46,24);
  
  //lineaPositivaHorizontalhaciaR2
  stroke(#37B44E);
  line(176,155,272,155);
  
  //lineaPositivaVerticalhaciaR2
  stroke(#37B44E);
  line(272,155,272,199);
  
  //LINEAS INTERNAS R1
  stroke(0);
  line(130,157,138,143);
    
  stroke(0);
  line(138,143,147,165);
  
  stroke(0);
  line(147,165,159,143);
    
  stroke(0);
  line(159,143,169,165);
  
  stroke(0);
  line(169,165,176,155);
  
  //RESISTENCIA 2 R2
  
  //r2
  textSize(14);
  fill(0);
  text("R2 = "+nfs(r2,0,1)+" KOhm",340,225);
  
  
  //vr2
  textSize(16);
  fill(#D38C1A);
  text(""+nfs(vr2,0,1)+" V",240,225); 
  //+ Y -
  textSize(16);
  fill(#D38C1A);
  text("+",228,209); 
  
  textSize(16);
  fill(#D38C1A);
  text("-",228,239); 
  
  //Rectangulo R2
  
  fill(255, 255, 0);
  stroke(0);
  rect(260,199,24,46);
  
  //lineaNegativaVerticalhaciaFuente
  stroke(#37B44E);
  line(272,246,272,265);
  
  //lineaNegativaHorizontalhaciaFuente
  stroke(#37B44E);
  line(272,265,77,265);
  
  //lineaNegativaVerticalhaciaR2
  stroke(#37B44E);
  line(77,246,77,265);
  
  //LINEAS INTERNAS R2
  stroke(0);
  line(272,199,284,209);
    
  stroke(0);
  line(284,209,260,219);
  
  stroke(0);
  line(260,219,284,230);
    
  stroke(0);
  line(284,230,260,239);
  
  stroke(0);
  line(260,239,272,244);  
  
  
  //LineaDeAmperaje
  
  stroke(#DE452B);
  line(205,251,133,251);
  stroke(#DE452B);
  line(133,251,141,243);
  stroke(#DE452B);
  line(133,251,141,260);
  
  //Amperaje
  textSize(13);
  fill(#DE452B);
  text("I = "+nfs(i,0,1)+" mA",179,241);
  
}


void mousePressed() {


  
  if(mouseX>=58 && mouseX<=99 && mouseY>=204 && mouseY<=245) {
    
    
    float voltajeTemporal = v1;
    String voltajeFuente = JOptionPane.showInputDialog("Voltaje en la fuente");
    v1 = Float.parseFloat(voltajeFuente);
          
    if(v1<=0 || v1 >= 25) {   
      JOptionPane.showMessageDialog(null, "Valor No Valido");
      v1 = voltajeTemporal;
    }    
   }
   
  if(mouseX>=132 && mouseX<=177 && mouseY>=144 && mouseY<=167){
    
    float voltajeTemporal = r1;
    String resistenciaR1 = JOptionPane.showInputDialog("Valor Resistencia R1");
    r1 = Float.parseFloat(resistenciaR1);
    
    if(r1<=10 || r1 >= 1000000) {   
      JOptionPane.showMessageDialog(null, "Valor No Valido");
      r1 = voltajeTemporal;
    } 
  }
  
  
  else if(mouseX>=262 && mouseX<=285 && mouseY>=200 && mouseY<=245){
    
    float voltajeTemporal = r2;
    String resistenciaR2 = JOptionPane.showInputDialog("Valor Resistencia R2");
    r2 = Float.parseFloat(resistenciaR2);
    
    if(r2<=10 || r2 >= 1000000) {   
      JOptionPane.showMessageDialog(null, "Valor No Valido");
      r2 = voltajeTemporal;
    } 
  }
}




float calcularIntensidad (float voltaje, float valorr1, float valorr2) {

  float i = ((voltaje)/(valorr1+valorr2)) * (1000);
  
  return i;
  
}

float calcularVr1 (float i, float valorr1) {

  float vr1 = (i*valorr1) / 1000;
  
  return vr1;
  
}

float calcularVr2 (float i, float valorr2) {

  float vr2 = (i*valorr2) / 1000;
  
  return vr2;
  
}
