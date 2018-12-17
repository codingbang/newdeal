package algorithm.perfectNumber;

import java.util.Scanner;

public class App {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    
    System.out.print("자연수 입력 >> ");
    int num = sc.nextInt();
    
    PerfectNumber pfn = new PerfectNumber();
    pfn.printPerfectNumber(num);
    
    
    sc.close();
    
  }
}
