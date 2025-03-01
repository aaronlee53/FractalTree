private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  

public void setup() 
{   
  size(640,600);    
  noLoop(); 
}

public void draw() 
{   
  background(0);   
  stroke(0,255,0);   
  line(320,600,320,480);   
  drawBranches(320,480,100,3*Math.PI / 2); 
} 

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
      if (branchLength < smallestBranch){
        return;
      }
      
      int Xend1 = (int)(branchLength * Math.cos(angle + branchAngle) + x);
      int Yend1 = (int)(branchLength * Math.sin(angle + branchAngle) + y);
      int Xend2 = (int)(branchLength * Math.cos(angle - branchAngle) + x);
      int Yend2 = (int)(branchLength * Math.sin(angle - branchAngle) + y);
      
      line(x, y, Xend1, Yend1);
      line(x, y, Xend2, Yend2);
      
      drawBranches(Xend1, Yend1, branchLength * fractionLength, angle + branchAngle);
      drawBranches(Xend2, Yend2, branchLength * fractionLength, angle - branchAngle);
} 
