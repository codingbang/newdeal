package oop2;

/*
시나리오 (요규사항)
저희는 가전제품 매장 솔루션 개발 사업팀 입니다
A라는 가전제품 매장이 오픈 되면 ....

[ 클라이언트 요구사항 ]
가전제품은 제품의 가격 , 제품의 포인트 정보를 공통적으로 가지고 있다
각각의 가전제품은 제품별 이름을 가지고 있다 

각각의 전자제품은 이름을 가지고 있다 (ex : Tv , Audio , Computer)
각각의 전자제품은 다른 가격을 가지고 있다(ex : Tv:5000 , Audio:6000)
제품의 포인트는 가격의 10%를 가진다

*/
class Product{
 int price;
 int bonuspoint;
 
 public Product() {
  
 }
 Product(int price) {
  this.price = price;
  this.bonuspoint = (int)(this.price/10.0);
 }
}




class KtTv extends Product{
 KtTv(){
  super(500);
 }
 @Override
 public String toString() {
  return "KtTv";
 }
}

class Audio extends Product{
 Audio(){
  super(100);
 }
 @Override
 public String toString() {
  return "Audio";
 }
}
class NoteBook extends Product{
 NoteBook(){
  super(150);
 }
 @Override
 public String toString() {
  return "NoteBook";
 }
}

//시뮬레이션 시나리오
//구매자 : 제품을 구매하기 위한 금액정보 , 포인트 정보를 가지고 있다
//구매자는 제품을 구매할 수 있다 , 구매행위를 하게 되면 가지고 있는 금액은
//감소하고 포인트는 올라간다
//구매자는 처음 초기 금액을 가진다

//구매행위 
//구매행위 (잔액금액 - 제품의 가격 , 포인트 갱신)
//구매자는 매장이 있는 모든 제품을 구매할 수 있다
//구현 함수
//매장에 있는 (Kttv , audio , notebook) 구매 하세요
//kttvbuy(){} , audiotbuy(){} , notebookbuy(){}

//문제) 위 시나리오 기반으로 구매자 클래스를 구현하세요

class Buyer {
  private int money;
  private int point;
  
  public Buyer() {
    this.money = 10000;
    this.point = 0;
  }
  
  public Buyer(int money) {
    this.money = money;
    this.point = 0;
  }
  
  public void buy(Product product) {
    System.out.println(product.toString() + "구매");
    System.out.println("기존 잔액 : " + money);
    System.out.println("기존 포인트 : " + point);
    money -= product.price;
    point += product.bonuspoint;
    System.out.println("구매 후 잔액 : " + money);
    System.out.println("구매 후 포인트 : " + point);
    System.out.println();
  }
  
  public void getBuyerInfo() {
    System.out.println("잔액 : " + money);
    System.out.println("포인트 : " + point);
  }

}

