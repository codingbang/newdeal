package algorithm.correctNum;

import java.util.Random;
import java.util.Scanner;

public class CorrectNum {
  private int randomNum;
  private int myInputNumber;
  private int count;
  private  Scanner sc;
  
  public void execute() {
    count = 1;
    makeRandomNum();
    sc = new Scanner(System.in);
    while (randomNum != myInputNumber) {
      inputNum();
      checkNum();
    };
    
    sc.close();
  }
  private void makeRandomNum() {
    Random random = new Random();
    randomNum = random.nextInt(100)+1;
    System.out.println("수 결정완료! 맞추세요!");
  }
  
  private void inputNum() {
    System.out.printf("%d회차 수를 입력하세요 >>>", count);
    myInputNumber = Integer.parseInt(sc.nextLine());
  }
  
  private void checkNum() {
    if (randomNum > myInputNumber) {
      System.out.println("입력한 수 보다 정답이 더 큽니다.");
      count++;
    } else if(randomNum < myInputNumber) {
      System.out.println("입력한 수 보다 정답이 더 작습니다.");
      count++;
    } else {
      System.out.println("정답입니다.");
      System.out.printf("랜덤 수 : %d\n" ,randomNum);
      System.out.printf("시도한 횟수 : %d\n",count);
      reGame();
    }
  }
  
  public void reGame() {
    System.out.println("ReGame? (Y or N) >>");
    String yn = sc.nextLine();
    if ("y".equals(yn)) {
      execute();
    } else if("n".equals(yn)) {
      System.out.println("게임종료.");
    }
  }
}
