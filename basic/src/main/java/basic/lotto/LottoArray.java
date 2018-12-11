package basic.lotto;
import java.io.File;
import java.io.FileWriter;
import java.util.Random;
import java.util.Scanner;

public class LottoArray {

  int[] randomNumber;
  int[] myInputNumber;
  
  public LottoArray() {
    randomNumber = new int[6];
    myInputNumber = new int[6];
  }

  public void execute() {
    System.out.println("========로또 게임========");
    this.myInputNumber = inputNumber();
    this.randomNumber = makeNum();
    result(randomNumber, myInputNumber);
    saveFile();
  }


  //번호 입력받는 메소드
  public int[] inputNumber() {
    Scanner sc = new Scanner(System.in);
    int[] inputNumber = new int[6];

    for (int i = 0; i < inputNumber.length; i++) {
      System.out.printf("%d 번째 숫자 입력 >>> ", i+1);
      inputNumber[i] = sc.nextInt();
      System.out.println();

      //입력 값 검사
      if (inputNumber[i] <= 0 || inputNumber[i] > 45) {
        System.out.println("입력한 값이 0 이하이거나 45 초과입니다.");
        System.out.printf("%d 번째를 다시 입력해주세요\n", i+1);
        i--;
      }

      //중복검사
      for (int j = 0; j < i; j++) {
        if (inputNumber[i] == inputNumber[j]) {
          System.out.printf("%d 번째와 %d째 수가 중복됩니다.", i+1, j+1);
          System.out.printf("%d 번째를 다시 입력해주세요\n", i+1);
          i--;
        }
      }

      //정렬
      for (int j = 0; j < i; j++) {
        if (inputNumber[i] < inputNumber[j]) {
          int temp = inputNumber[i];
          inputNumber[i] = inputNumber[j];
          inputNumber[j] = temp;
        }
      }

    }
    System.out.print("입력한 숫자는 [ ");
    for (int i = 0; i < inputNumber.length; i++) {
      System.out.printf("%d ",inputNumber[i]);
    }
    System.out.println("] 입니다. ");
    sc.close();
    return inputNumber;
  }

  //난수 발생 메소드
  public int[] makeNum() {
    Random random = new Random();
    int[] randomNo = new int[6];

    for(int i=0; i<randomNo.length; i++) {
      randomNo[i] = random.nextInt(45)+1;

      //중복검사
      for (int j = 0; j < i; j++) {
        if (randomNo[i] == randomNo[j]) {
          i--;
        }
      }

      //정렬
      for (int j = 0; j < i; j++) {
        if (randomNo[i] < randomNo[j]) {
          int temp = randomNo[i];
          randomNo[i] = randomNo[j];
          randomNo[j] = temp;
        }
      }
    }

    System.out.print("랜덤 번호는 [ ");
    for (int i = 0; i < randomNo.length; i++) {
      System.out.printf("%d ",randomNo[i]);
    }
    System.out.println("] 입니다. ");
    return randomNo;
  }

  //결과 출력하는 메소드
  public void result(int[] randomNo, int[] inputNo) {
    int count = 0;

    for (int i = 0; i < inputNo.length; i++) {
      for (int j = 0; j < randomNo.length; j++) {
        if (inputNo[i] == randomNo[j]) {
          count++;
        }
      }
    }

    System.out.println("=====결과=====");
    System.out.printf("일치하는 개수는 %d 개\n", count);
  }


  //결과들을 파일로 저장하는 메소드
  public void saveFile() {
    String text="test";
    String fileName = "C:/lotto.txt";
    try {
      File file = new  File(fileName);

      FileWriter fw = new FileWriter(file, true);

      fw.write(text);
      fw.flush();
      fw.close();

    } catch (Exception e) {
      e.printStackTrace();
    }

  }
}
