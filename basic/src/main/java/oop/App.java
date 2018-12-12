package oop;

public class App {
  public static void main(String[] args) {
    Triangle triangle = new Triangle();
    triangle.printTraianglePoint();
    
    Point[] points = new Point[3];
    points[0] = new Point(1,2);
    points[1] = new Point(3,4);
    points[2] = new Point(5,6);
    
    System.out.println("=========");
    triangle = new Triangle(points);
    triangle.printTraianglePoint();
    
  }
}
