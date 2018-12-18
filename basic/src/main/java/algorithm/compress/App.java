package algorithm.compress;

import java.util.Scanner;

public class App {
  public static void main(String[] args) {
    //문자열을 입력받아서, 같은 문자가 연속적으로 반복되는 경우에 그 반복 횟수를 표시하여 문자열을 압축하기.
    //입력 예시: aaabbcccccca
    //출력 예시: a3b2c6a1
    
    Scanner sc = new Scanner(System.in);
    System.out.print("문자 입력 >> ");
    String str = sc.nextLine();
    StringCompress compress = new StringCompress();
    compress.compress(str);
    sc.close();
  }
}
