PShader nebula;
import controlP5.*;
String listCommands= "";
String sCommand = "";
Textlabel codeLabel;
Textlabel execLabel;
//ArrayList <Command> ArrayCommands = new ArrayList <Command>();
String[] ArrayCommands;
String[] cmdCopy;
int time;
int execute = 1000;
ControlP5 cp5;
Textarea myTextarea;
Textarea cmdTextArea;

void setup() {
  time = millis();
  size(1000,1000, P2D);
  cp5 = new ControlP5(this);
  //cp5.begin(cp5.addBackground("bg"));
  
   codeLabel = cp5.addTextlabel("label")
                    .setText("CODE")
                    .setPosition(10,770)
                    .setColorValue(0xff00ff00)
                    .setFont(createFont("arial",12))
                    ;
   execLabel = cp5.addTextlabel("label1")
                    .setText("EXECUTE")
                    .setPosition(510,770)
                    .setColorValue(0xff00ff00)
                    .setFont(createFont("arial",12))
                    ;
myTextarea = cp5.addTextarea("txt")
                  .setPosition(0,800)
                  .setSize(500,200)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(128))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ;
  myTextarea.setText("");
  
    cmdTextArea = cp5.addTextarea("cmdTxt")
                  .setPosition(500,800)
                  .setSize(500,200)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(0,255,0))
                  .setColorBackground(color(255,60))
                  .setColorForeground(color(255,60));
                  ;
  cmdTextArea.setText("");
    
  cp5.addSlider("Power")
     .setRange(100,400)
     .setValue(200)
     .setPosition(10,650)
     .setSize(100,19)
     ;
     
  cp5.addSlider("CPU")
     .setRange(100,400)
     .setValue(200)
     .setPosition(10,700)
     .setSize(100,19)
     ;
  nebula = loadShader("earth.glsl");
   nebula.set("resolution", float(width), float(height));
}

void draw() {

  background(0);
 // noStroke();
 // noFill();
//rect(0,0,width,height);
  myTextarea.setText(sCommand);
  //cmdTextArea.setText(listCommands);
  if(keyPressed && key==ENTER) {
    if(sCommand.length()>0){

      //ArrayCommands.add(new Command(sCommand));
     listCommands = cmdTextArea.getText();
     listCommands += sCommand.toUpperCase();
     ArrayCommands = split(listCommands,'\n');
     listCommands = "";
             for(int i = 0; i<ArrayCommands.length; i++){
                   listCommands += ArrayCommands[i]+"\n";
                                                        }
                                                        cmdTextArea.setText(listCommands);
     sCommand = "";
     
    }
  }
  
  //Ticks to execute commands
  if((millis() - time >= execute)&&(listCommands.length()>0)){
    String currentCmd = processCmds(ArrayCommands);
    print(currentCmd);
    //listCommands = listCommands.replace(processCmds(listCommands),"");
    time = millis();
    //listCommands = listCommands.substring(currentCmd.length()+1);
    arrayCopy(ArrayCommands,1,ArrayCommands,0,ArrayCommands.length-1);
         listCommands = "";
         
                   for(int i = 0; i<ArrayCommands.length; i++){
                   listCommands += ArrayCommands[i]+"\n";
                                                        }
                                                        cmdTextArea.setText(listCommands);
       
  }
 // nebula.set("time", millis() / 5000.0);  
 // shader(nebula); 
  
  
}

String processCmds(String[] ArrayCommands){
  
  return ArrayCommands[0];
}

void keyPressed() {
   if (keyCode == BACKSPACE) {
    if (sCommand.length() > 0) {sCommand = sCommand.substring(0, sCommand.length()-1); }
  } else if (keyCode == DELETE) {
    sCommand = "";
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    sCommand = sCommand + key;
  }
}
//void changeWidth(int theValue) {
 // myTextarea.setWidth(theValue);
//}

//void changeHeight(int theValue) {
 // myTextarea.setHeight(theValue);
//}

