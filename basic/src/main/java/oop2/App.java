package oop2;

public class App {
  public static void main(String[] args) {
    KtTv kttv = new KtTv();
    Audio audio = new Audio();
    NoteBook notebook = new NoteBook();

    Buyer buyer = new Buyer();

    Product tv = new KtTv();
    buyer.buy(tv);

    buyer.buy(kttv);
    buyer.buy(audio);
    buyer.buy(notebook);
    
    buyer.getBuyerInfo();
    
  }
}
