package array;

public class App {
  
  public static void main(String[] args) {
    /*
    1. 수학과 학생들의 기말고사 시험 점수
    int[] score = new int[] {79,88,97,54,56,95};
    int max = score[0]; //79
    int min = score[0]; //79
    
    1.제어문을 사용해서 
    max 변수에 최대값 : 97
    min 변수에 최소값 : 54 들어가게 해서 max , min 값을 출력
    */
    
    int[] score = new int[] {79,88,97,54,56,95};
    int max = score[0]; //79
    int min = score[0]; //79
    
    for (int i = 0; i < score.length; i++) {
      if (max < score[i]) {
        max = score[i];
      } else if (min > score[i]) {
        min = score[i];
      }
    }
    
    //삼항연산 사용
    for (int i = 0; i < score.length; i++) {
      max = (score[i] > max) ? score[i] : max;
      min = (score[i] < min) ? score[i] : min;
    }
    
    
    System.out.println("(1번문제)");
    System.out.println("최대값 : " + max);
    System.out.println("최소값 : " + min);
    

    System.out.println("=============");
    /*
    2. 어느 학생의 기말 성적
    int sum=0;
    float average = 0f;
    int[] jumsu = {100,55,90,60,78};
    1. 총 과목수
    2. 점수의 합
    3. 점수의 평균을 구하세요  (2,3 번은 하나의 for문에서)
    */
    
    int sum=0;
    float average = 0f;
    int[] jumsu = {100,55,90,60,78};
    
    for (int i = 0; i < jumsu.length; i++) {
      sum += jumsu[i];
      if (i==jumsu.length -1) {
        average = (float)sum/jumsu.length;
      }
    }
    System.out.println("(2번문제)");
    System.out.printf("합 : %d\n", sum);
    System.out.printf("평균 : %.2f\n", average);
    
  }

}
