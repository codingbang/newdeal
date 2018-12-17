package algorithm.rps;

import java.util.Random;
import java.util.Scanner;

public class RockPaperScissorsApp {

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    int totalFloor = 0;
    int comNo = 0;
    int myNo = 0;
    int myFloor = 0;
    int comFloor = 0;
    boolean flag = false;
    boolean quit = false;
    String quitYN;
    do {
      System.out.print("계단의 수를 입력해 주세요. >> ");
      totalFloor = Integer.parseInt(sc.nextLine());
      
      while (true) {
        Random random = new Random();
        comNo = random.nextInt(3)+1;
        System.out.print("가위/바위/보 중에 선택 해주세요. >> ");
        switch (sc.nextLine()) {
          case "가위":
            myNo = 1;
            break;
          case "바위":
            myNo = 2;
            break;
          case "보":
            myNo = 3;
            break;

          default:
            System.out.println("잘못된 입력입니다.");
            break;
        }
        
        if (comNo == myNo) {
          System.out.println("무승부 입니다.");
        } else if(comNo==1) {
          if (myNo == 2) {
            myFloor += 3;
            System.out.println("승리");
          }else if (myNo == 3) {
            comFloor += 2;
            System.out.println("패배");
          }
        } else if(comNo==2) {
          if (myNo==3) {
            myFloor += 5;
            System.out.println("승리");
          } else if(myNo==1) {
            comFloor += 3;
            System.out.println("패배");
          }
        } else if(comNo==3) {
          if (myNo==1) {
            myFloor += 2;
            System.out.println("승리");
          } else if(myNo==2) {
            comFloor += 5;
            System.out.println("패배");
          }
        }
        System.out.println();
        
        if (myFloor >= totalFloor || comFloor >=totalFloor) {
          if (myFloor >= totalFloor) {
            System.out.println("등반완료 나의 승리!");
          } else {
            System.out.println("COM의 등반완료 COM 승리!");
          }
          flag = true;
          break;
        } else {
          flag = false;
        }
      }
      
      System.out.println("다시 시작 하시겠습니까?");
      System.out.print("(y / n) 입력 >> ");
      quitYN = sc.nextLine();
      if (quitYN == "y") {
        quit = false;
      } else {
        quit = true;
      }
    } while (quit);

  }

}
