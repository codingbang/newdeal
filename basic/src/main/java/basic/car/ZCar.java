package basic.car;
//아래 코드는 비효율적인 코드를 가지고 있어요 
//이유는 무었일까요 : ZCar2
class Zcar {
  private String color;
  private String geartype;
  private int door;
  
  Zcar(){
      this.color = "red";
      this.geartype = "auto";
      this.door = 4;
      System.out.println("default constructor");
  }
  
  Zcar(String color , String geartype , int door){
      this.color = color;
      this.geartype = geartype;
      this.door = door;
      System.out.println("overloading constructor");
  }
  void print() {
      System.out.println(    this.color + "/" + this.geartype + "/" + this.door);
  }
}
