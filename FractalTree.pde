private double smallestBranch = 10; 
private double branchLength = 2;
private double branchAngle = .2;  
private double fractionLength = .8; 
private double smallestBranch2 = 10; 
private double branchLength2 = 2;
private double branchAngle2 = .2;  
private double fractionLength2 = .8; 

public void setup() {   
  size(1280,650);    
  strokeWeight(2);
} 

public void ranStroke() {
  float r = (float)(Math.random() * 255);
  float g = (float)(Math.random() * 255);
  float b = (float)(Math.random() * 255);
  stroke(r, g, b);
}
boolean explode = true;
boolean explode2 = true;

public void draw() {   
  fill(0, 0, 0, 25);
  rect(0, 0, width, height);
  ranStroke();
  line(320,700,320,380);   
  drawBranches(320, 380, branchLength, 3 * PI/2);
  if(branchLength < 100 && explode) { 
    branchLength++;
    branchAngle*=1.02;
    if(branchLength >= 100) {
      explode = false;
    }
  }else{
    branchLength--;
    branchAngle/=1.02;
    if(branchLength <= 2.1) {
      explode = true;
    }
  }   

  line(920,700,920,380);
  drawBranches2(920, 380, branchLength, 3 * PI/2);
  if(branchLength2 < 100 && explode) { 
    branchLength2++;
    branchAngle2*=1.035;
    if(branchLength2 >= 100) {
      explode2 = false;
    }
  }else {
    branchLength2--;
    branchAngle2/=1.035;
    if(branchLength2 <= 2) {
      explode2 = true;
    }
  }
} 
public void drawBranches(int x,int y, double branchLength, double angle) {   
    double angle1, angle2;
    angle1 = angle + branchAngle;
    angle2 = angle - branchAngle;
    branchLength *= fractionLength;
    int endX1, endY1, endX2, endY2;
    endX1 = (int)(branchLength*Math.cos(angle1) + x);
    endY1 = (int)(branchLength*Math.sin(angle1) + y);
    endX2 = (int)(branchLength*Math.cos(angle2) + x);
    endY2 = (int)(branchLength*Math.sin(angle2) + y);
    ranStroke();
    line(x, y, endX1, endY1);
    line(x, y, endX2, endY2);

    if(branchLength > smallestBranch) {
        drawBranches(endX1, endY1, branchLength, angle1);
        drawBranches(endX2, endY2, branchLength, angle2);
    }
}    
public void drawBranches2(int x,int y, double branchLength, double angle) {   
    double angle1, angle2;
    angle1 = angle + branchAngle2;
    angle2 = angle - branchAngle2;
    branchLength *= fractionLength2;
    int endX1, endY1, endX2, endY2;
    endX1 = (int)(branchLength*Math.cos(angle1) + x);
    endY1 = (int)(branchLength*Math.sin(angle1) + y);
    endX2 = (int)(branchLength*Math.cos(angle2) + x);
    endY2 = (int)(branchLength*Math.sin(angle2) + y);
    ranStroke();
    line(x, y, endX1, endY1);
    line(x, y, endX2, endY2);

    if(branchLength > smallestBranch2) {
        drawBranches(endX1, endY1, branchLength, angle1);
        drawBranches(endX2, endY2, branchLength, angle2);
    }
}


