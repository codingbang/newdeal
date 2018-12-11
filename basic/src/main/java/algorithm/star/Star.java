package algorithm.star;

public class Star {
  
  public void createStar(int star) {
    for (int i = 0; i <= star; i++) {
      for (int j = 0; j < i; j++) {
        System.out.print("*");
      }
      System.out.println();
    }
  }
}
