package algorithm.perfectNumber;

public class PerfectNumber {

  public void printPerfectNumber(int num) {
    int result = 0;

    for (int i = 0; i <=num; i++) {
      if (i != 0 && (num%i) == 0 && i != num) {
        result += i;
        System.out.println("약수 : " + i);
      }
    }

    if (result == num) {
      System.out.println("완전수");
    }
  }
}
