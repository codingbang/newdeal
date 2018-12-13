package oop4;

class Singleton{
  /*private static Singleton singleton;
  
  private Singleton() {
    
  }
  
  public static Singleton getInstance () {
    if(singleton != null) {
      return singleton;
    }
    singleton = new Singleton();
    return singleton;
  }*/
  
  private static Singleton singleton = new Singleton();
  
  private Singleton() {
    
  }
  
  public static Singleton getInstance () {
    return singleton;
  }
  
}


