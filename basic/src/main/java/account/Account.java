package account;

import java.util.ArrayList;
import java.util.List;

public class Account {
  private String accountNo;
  private String masterName;
  private long money;
  private List<Transaction> transactions;
  
  public Account(String accountNo, String masterName) {
    this.accountNo = accountNo;
    this.masterName = masterName;
    this.money = 0;
    transactions = new ArrayList<>();
  }
  
  //입금
  public void deposit(long account) {
    this.money += account;
    transactions.add(new Transaction("in", account, money));
  }
  
  //출금
  public void withdraw(long account) {
    this.money -= account;
    transactions.add(new Transaction("out", account, money));
  }
  
  //잔액확인
  public long getMoney() {
    return money;
  }

  //거래내역 확인
  public List<Transaction> getTransactions() {
    return transactions;
  }

  public String getAccountNo() {
    return accountNo;
  }

  public String getMasterName() {
    return masterName;
  }

  
  
}
