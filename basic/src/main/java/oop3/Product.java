package oop3;

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
  private Product[] products = new Product[10];
  private int count;
  
  public Buyer() {
    this.money = 10000;
    this.point = 0;
  }
  
  public Buyer(int money) {
    this.money = money;
    this.point = 0;
  }
  
  public void buy(Product product) {
    if (count > 10) {
      System.out.println("최대 개수를 초과하였습니다.");
      return;
    }
    products[count++] = product;
    System.out.printf("장바구니에 %s을 담았습니다.\n", product.toString());;
  }

  private void checkPrice(Product product) {
    if (this.money < product.price) {
      System.out.println("잔액이 부족합니다.");
      System.out.println(product.toString() + "구매 실패");
      return;
    }
  }
  
  public void summary() {
    for (int i = 0; i < count; i++) {
      money -= products[i].price;
      point += products[i].bonuspoint;
      checkPrice(products[i]);
      
      System.out.println(products[i].toString() + "구매 완료");
      getBuyerInfo();
    }
  }

  public void getBuyerInfo() {
    System.out.printf("잔액 : %d\n" ,money);
    System.out.printf("포인트 : %d\n\n" ,point);
  }
  
  //제품이 계속 추가되더라도 구매행위는 이루어져야 한다
  //why : 즐거운 휴가를 보내기 위해서
  //* 반복적인 코드 제거
  //* 하나의 함수가 모든 물건에 대한 구매 처리
  //key : 모든 제품은 Product 상속하고 있다 (모든 제품의 부모 Product)
  //전제조건 : Product 부모로 
  //다형성 : 하나의 [참조 변수]가  [여러개의 타입]을 가질 수 있다
  //**주의 사항 : 부모타입으로 접근 하더라도 자식에서 재정의 된 자원이
  //있다면 재정의 자원을 호출  > 부모꺼 그리워요 (함수 안에 super())
  
  /*
  OOP 확인문제 2 에 추가사항 입니다
  요구사항
  카트 (Cart)
  카트에는 매장에 있는 모든 전자제품을 담을 수 있다 
  카트의 크기는 고정되어 있다 (10개) : 1개  , 2개 담을 수 있고 최대 10개까지 담을 수 있다
  고객이 물건을 구매 하면 ... 카트에 담는다

  계산대에 가면 전체 계산
  계산기능이 필요
  summary() 기능 추가해 주세요
  당신이 구매한 물건이름 과 가격정보 나열
  총 누적금액 계산 출력

  hint) 카트 물건을 담는 행위 (Buy())
  hint) summary()  main 함수에서 계산할때

  구매자는 default 금액을 가지고 있고 초기금액을 설정할 수 도 있다
 */
}

