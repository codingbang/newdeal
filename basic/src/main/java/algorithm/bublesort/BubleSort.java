package algorithm.bublesort;

import java.util.Scanner;

public class BubleSort {
  /*문제 N개의 수가 주어졌을 때, 이를 오름차순으로 정렬하는 프로그램을 작성하시오. 첫째 줄에 수의 개수 N(1<=N<=10)이 주어진다.
  둘째 줄부터 N개의 줄에는 숫자가 주어진다. 이 수는 절대값이 10보다 작거나 같은 정수이다. 수는 중복되지 않는다. 첫째 줄부터 N개의
  줄에 오름차순으로 정렬한 결과를 한 줄에 하나씩 출력한다.*/
  
  private int[] nums;
  Scanner sc;
  
  public void execute() {
    makeArry();
    
    sc = new Scanner(System.in);
    for (int i = 0; i < nums.length; i++) {
      System.out.printf("%d 번째 숫자 입력 >> ", i+1);
      int inputNum = Integer.parseInt(sc.nextLine());
      if (inputNum < 0 || inputNum > 10) {
        System.out.printf("%d 번째를 수가 0~10 사이가 아닙니다.\n", i+1);
        i--;
      } else {
        nums[i] = inputNum;
        //중복검사
        for (int j = 0; j < i; j++) {
          if (nums[i] == nums[j]) {
            System.out.printf("%d 번째와 %d째 수가 중복됩니다.", i+1, j+1);
            System.out.printf("%d 번째를 다시 입력해주세요\n", i+1);
            i--;
          }
        }
      }
      
      //sort
      for (int j = 0; j < nums.length; j++) {
        int temp;
        if (nums[i] < nums[j]) {
          temp = nums[i];
          nums[i] = nums[j];
          nums[j] = temp;
        }
      }
    }
    sc.close();
    printSort();
    
  }
  
  
  public void makeArry() {
    System.out.printf("정렬할 개수를 입력하세요 >> ");
    sc = new Scanner(System.in);
    int num = Integer.parseInt(sc.nextLine());
    nums = new int[num];
  }
  
  public void printSort() {
    System.out.print("[ ");
    for (int i = 0; i < nums.length; i++) {
      System.out.printf("%d ", nums[i]);
    }
    System.out.print("]");
  }
  
}
