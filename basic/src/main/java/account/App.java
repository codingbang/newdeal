package account;

public class App {

  public static void main(String[] args) {
    Bank bank = new Bank();
    bank.execute(new Account("123", "name1"));
  }

}
