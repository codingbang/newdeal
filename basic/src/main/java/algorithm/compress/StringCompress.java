package algorithm.compress;

public class StringCompress {
  //문자열을 입력받아서, 같은 문자가 연속적으로 반복되는 경우에 그 반복 횟수를 표시하여 문자열을 압축하기.
  //입력 예시: aaabbcccccca
  //출력 예시: a3b2c6a1
  public void compress(String str) {
    String resultStr = "";
    char currentChr;
    char preChr;
    int count = 0;
    
    preChr = str.charAt(0);
    for (int i = 0; i < str.length(); i++) {
      currentChr = str.charAt(i);
      if (currentChr == preChr) {
        count++;
      } else {
        resultStr += String.valueOf(preChr)+count;
        preChr = currentChr;
        count=1;
      }
    }
    resultStr += String.valueOf(preChr)+count;
    System.out.println(resultStr);
  }

}
