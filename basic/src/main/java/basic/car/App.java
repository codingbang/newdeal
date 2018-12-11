package basic.car;

public class App {

  public static void main(String[] args) {
    Zcar zcar1 = new Zcar();
    Zcar zcar2 = new Zcar("blue", "auto", 2);
    
    zcar1.print();
    zcar2.print();
  }

}
