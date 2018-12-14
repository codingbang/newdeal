package string;

import java.util.Scanner;

public class IdCardNumber {
  //주민번호 : 뒷번호 첫자리 : 1,3 남자 , 2,4 여자
  //main 함수 Scanner  사용 주민번호 입력받고
  //앞:6자리 뒷:7자리
  //입력값 : 123456-1234567 
  //1. 자리수 체크 (기능)함수 (14 ok)
  //2. 뒷번호 첫번째 자리값 1~4까지의 값만 허용 기능함수
  //3. 뒷번호 첫번째 자리값을 가지고 1,3 남자 , 2,4 여자 출력 기능함수
  //3개의 함수 static 를 만들고 1,2번을 만족하지 않으면 계속 입력을 받으세요
  
  
  public static void main(String[] args) {
    
    Scanner sc = new Scanner(System.in);
    String idCardNumber;
    boolean flag = true;
    
    do {
      System.out.println("주민번호를 입력해주세요.");
      System.out.println("ex) 123456-1234567");
      System.out.print("입력 >>>> ");
      idCardNumber = sc.nextLine();
      flag = checkLength(idCardNumber);
      flag = checkBackFirstNum(idCardNumber);
      checkGender(idCardNumber);
    } while(flag);
    
  }
  
  public static boolean checkLength(String idCardNumber) {
    return (idCardNumber.length()==14) ? true : false;
  }
  
  public static boolean checkBackFirstNum(String idCardNumber) {
    String backFirstNum = idCardNumber.substring(7, 8);
    if (backFirstNum == "1" || backFirstNum == "2" || backFirstNum == "3" || backFirstNum == "4") {
      return true;
    } 
    return false;
  }
  
  public static void checkGender(String idCardNumber) {
    String backFirstNum = idCardNumber.substring(7, 8);
    switch (backFirstNum) {
      case "1":
        System.out.println("남성입니다.");
        break;
      case "3":
        System.out.println("남성입니다.");
        break;
      case "2":
        System.out.println("남성입니다.");
        break;
      case "4":
        System.out.println("여성입니다.");
        break;

      default:
        System.out.println("잘못된 주민번호 입니다.");
    }

  }

}
