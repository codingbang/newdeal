package algorithm.binarySpace;

public class BinarySpace {
  
  public void getBinarySpace(int num) {
    char[] binaryArray = Integer.toBinaryString(num).toCharArray();
    int count = 0;
    int result = 0;
    
    System.out.print("이진수 확인 : ");
    for (char c : binaryArray) {
      System.out.print(c);
    }
    
    for (int i = 0; i < binaryArray.length; i++) {
      if (binaryArray[i] == '0') {
        count++;
      } else if(binaryArray[i] == '1') {
        result = (result > count) ? result : count;
        count = 0;
      }
    }
    
    System.out.println("\n가장 긴 간격은 " + result + "칸");
    
  }

}
