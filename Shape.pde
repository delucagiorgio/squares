class Shape{
  
  PShape s;
  PVector center;
  float radius = canvas.width / tiles * 0.4;
  float angleStep = random(PI/2048,PI/128);
  float angle = angleStep;
  ArrayList<PVector> vertices;
  
  Shape(PVector origin){
    center = origin.copy();
    vertices = new ArrayList<PVector>();
    int vertex = 7 + ceil(random(15));
    float angle = 2 * PI / vertex;
    s = canvas.createShape();
    s.beginShape();
    s.noFill();
    s.strokeWeight(8);
    s.stroke(0);
    for(int i = 0; i < vertex; i++){
      float x = radius * random(0.7,1.3) * cos(angle * i);
      float y = radius * random(0.7,1.3) * sin(angle * i);
      vertices.add(new PVector(x,y));
      s.curveVertex(x,y);
    }
    s.endShape(CLOSE);
  }
  
  void show(){
    
    update();
    s.rotate(angle);
    canvas.shape(s, center.x + radius * 0.5, center.y+ radius * 0.5, radius, radius);
    angle = angle + angleStep;
  }  
  
  void update(){
    
    for(int i = 0; i < vertices.size(); i++){
      PVector realVert = vertices.get(i);
      PVector dest = PVector.random2D().mult(random(5.5, 15.5)).add(realVert);
      PVector steer = dest.sub(realVert);
      realVert.add(steer);
    }
    
    s = canvas.createShape();
    s.beginShape();
    s.noFill();
    s.strokeWeight(2);
    s.stroke(0);    
    for(PVector p : vertices){
      s.curveVertex(p.x,p.y);
    }
    s.endShape(CLOSE);  
  }
}
