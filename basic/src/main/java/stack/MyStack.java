package stack;

//Stack 자료 구조를 설명하고 아래 코드를 완성 하세요
public class MyStack {

  private Object[] stackArr;
  private int size;
  private int index;

  public MyStack(int size) {
    this.stackArr = new Object[size];
    this.size = size;
    this.index = 0;
  }

  public boolean empty() { // 스택이 비었는지 확인
    return index == 0; 
  }

  public boolean full() { //스택이 풀인지 확인
    return index == size;
  }

  public void push(Object i) {
    if (full()) {
      System.out.println("스택이 꽉 참");
    } else {
      stackArr[index++] = i;
    }
  }

  public Object pop() {
    if (empty()) {
      System.out.println("스택이 비었음");
      return null;
    } else {
      return stackArr[--index];
    }
 }
  
}