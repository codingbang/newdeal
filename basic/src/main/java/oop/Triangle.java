package oop;

/*
 * 아래 코드를 활용해서
 * 
 * 문제 삼각형 클래스를 만드세요 
 * 정의 : 삼각형은 3개의 점과 색과 그리고 그리다 라는 기능을 가지고 있다
 * 
 * Shape , Point 클래스 제공 삼각형은 도형이다 
 * 삼각형은 3개의 점을 가지고 있다 
 * hint) 점 3개 : (x,y) (x,y) (x,y)
 * 주의) default 그릴수 있고 , 3개의 좌표값을 받아서 그릴 수 있다
 * 
 */

class Shape {
  String color = "gold"; // 공통속성

  void draw() {
    System.out.println("그리다"); // 공통기능
  }
}

class Point {
  int x;
  int y;

  Point() {
    // this.x = 1;
    // this.y = 2;
    this(1, 2);
  }

  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
}


public class Triangle extends Shape {
  private Point[] points;
  
  public Triangle() {
    points = new Point[3];
    points[0] = new Point(1,2);
    points[1] = new Point(3,4);
    points[2] = new Point(5,6);
  }
  
  public Triangle(Point[] points) {
    this.points = points;
  }
  
  public void printTraianglePoint() {
    System.out.printf("x-%d, y-%d\n",points[0].x, points[0].y);
    System.out.printf("x-%d, y-%d\n",points[1].x, points[1].y);
    System.out.printf("x-%d, y-%d\n",points[2].x, points[2].y);
  }

}
