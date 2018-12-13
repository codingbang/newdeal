package algorithm.nara;

public class Nara {

  public static void main(String[] args) {

    Nara nara = new Nara();
    String result = nara.solution(7);
    System.out.println(result);
  }

  public String solution(int no) {
    if (no==0) {
      return "";
    }
    
    //뒷자리 결정
    //나머지 값이 0 일때 뒷자리는 4
    //아니면 1, 2가 됨.(3진법)
    int result = no%3;
    
    if (result == 0) {
      //-1을 해주어 자리수를 내리고 0 대신 4로 리턴
      return solution(no/3 - 1) + "4";
    } else {
      return solution(no/3) + result;
    }
    
  }
}
