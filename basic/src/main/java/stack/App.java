package stack;

public class App {
  public static void main(String[] args) {
    MyStack myStack = new MyStack(3);
    boolean flag;
    
    flag = myStack.empty();
    if (flag == true) {
      System.out.println("비었음");
    } else {
      System.out.println("꽉참");
    }
    
    myStack.push("111");
    myStack.push("222");
    myStack.push("333");
    
    flag = myStack.empty();
    if (flag == true) {
      System.out.println("비었음");
    } else {
      System.out.println("꽉참");
    }

    System.out.println(myStack.pop());
    System.out.println(myStack.pop());
    System.out.println(myStack.pop());
    
    
  }
}
