package basic.airplane;

public class AirPlane {
  private int no;
  private String name;
  
  private static int count;
  
  public AirPlane(int no, String name) {
    this.no = no;
    this.name = name;
    count = count+1;
  }
  
  public void printInfo() {
    System.out.printf("제작된 비행기 정보 : 번호-%d / 이름-%s\n", no, name);
  }
  
  public void printCount() {
    System.out.printf("제작된 비행기 수 : %d\n", count);
  }
}
