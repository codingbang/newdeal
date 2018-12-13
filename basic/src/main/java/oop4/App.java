package oop4;

public class App {
  public static void main(String[] args) {
    Singleton singleton1 = Singleton.getInstance();
    Singleton singleton2 = Singleton.getInstance();
    Singleton singleton3 = Singleton.getInstance();
    
    if (singleton1 == singleton2) {
      System.out.println("같은 인스턴스");
    }
    System.out.println("1 : " + singleton1.toString());
    System.out.println("2 : " + singleton2.toString());
    System.out.println("3 : " + singleton3.toString());

  }
}
