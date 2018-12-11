package algorithm.star;

import java.util.Scanner;

public class App {

  public static void main(String[] args) {
    System.out.println("별 개수 입력 >>>");
    int num = Integer.parseInt(new Scanner(System.in).nextLine());
    new Star().createStar(num);
  }

}
