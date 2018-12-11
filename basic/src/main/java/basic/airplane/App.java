package basic.airplane;

public class App {

  public static void main(String[] args) {
    
    AirPlane airPlane1 = new AirPlane(1, "비행기");
    AirPlane airPlane2 = new AirPlane(2, "미니 비행기");
    AirPlane airPlane3 = new AirPlane(3, "대형 비행기");
    AirPlane airPlane4 = new AirPlane(4, "초대형 비행기");
    
    airPlane1.printInfo();
    airPlane2.printInfo();
    airPlane3.printInfo();
    airPlane4.printCount();
    
  }

}
