package algorithm.anagram;

import java.util.Scanner;

public class App {

  public static void main(String[] args) {
    String first;
    String two;
    
    Scanner sc = new Scanner(System.in);
    System.out.println("첫번째 문자를 입력하세요");
    first = sc.nextLine();
    
    System.out.println("두번째 문자를 입력하세요");
    two = sc.nextLine();
    
    Anagram anagram = new Anagram();
    anagram.checkAnagram(first, two);
    
    sc.close();
    
  }
}
