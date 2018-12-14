package algorithm.anagram;

import java.util.Arrays;

public class Anagram {
  private boolean flag;
  
  
  public boolean checkLength(char[] firstArray, char[] twoArray) {
    if (firstArray.length != twoArray.length) {
      return false;
    }else {
      return true;
    }
  }
  public void checkAnagram(String first, String second) {
    char[] firstArray = first.toLowerCase().toCharArray();
    char[] secondArray = second.toLowerCase().toCharArray();
    checkLength(firstArray, secondArray);
    
    
    //1번 방법(직접 정렬하여 비교하는 방법)
    char[] tempArry = new char[firstArray.length];
    for (int i = 0; i < firstArray.length; i++) {
      for (int j = 0; j < secondArray.length; j++) {
        if (firstArray[i] == secondArray[j]) {
          tempArry[i] = secondArray[j];
          break;
        }
      }
    }
    String firstWord = new String(firstArray);
    String sortWord = new String(tempArry);
    flag = equalseArray(firstWord, sortWord);
    
    /*
    //2번 방법(Arrays 를 이용하는 방법)
    Arrays.sort(firstArray);
    Arrays.sort(secondArray);
    first = new String(firstArray);
    second = new String(secondArray);
    flag = equalseArray(first, second);
    */
    
    checkAnagramPrint();
  }
  
  public boolean equalseArray(String firstWord, String secondWord) {
    if (firstWord.equals(secondWord) ) {
      return true;
    } else {
       return false;
    }
  }
  
  public void checkAnagramPrint() {
    if (flag == true) {
      System.out.println("서로 같은문장 입니다."); 
    } else if(flag == false) {
      System.out.println("서로 틀린문장 입니다."); 
    }
  }
}
