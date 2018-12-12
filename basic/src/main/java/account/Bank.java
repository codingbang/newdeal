package account;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Bank {
  private List<Account> accountList;
  private int totalAccount;
  
  public Bank() {
    this.accountList = new ArrayList<>();
    this.totalAccount = accountList.size();
  }
  
  public void addAccount(String accountNo, String masterName) {
    Account account = new Account(accountNo, masterName);
    accountList.add(account);
    
  }
  
  public Account findByAccountNo(String accountNo) {
    Account account;
    for (int i = 0; i < totalAccount; i++) {
      String temp = accountList.get(i).getAccountNo();
      if (temp.equals(accountNo)) {
        account = new Account(accountList.get(i).getAccountNo(), accountList.get(i).getMasterName());
        
        return account;
      }
    }
    return null;
  }

  public List<Account> getAccountList() {
    return accountList;
  }

  public int getTotalAccount() {
    return totalAccount;
  }
  
  public void execute(Account account) {
    Scanner sc = new Scanner(System.in);
    String inputNo;
    do {
      System.out.println("1.입금\t2.출금\t3.잔고\t4.거래내역");
      System.out.println("시스템을 종료하시려면 'exit'를 입력하세요.");
      long money;
      
      inputNo = sc.nextLine();
      
      switch (inputNo) {
        case "1":
          System.out.println("입금할 금액을 입력해주세요.");
          money = Long.parseLong(sc.nextLine());
          account.deposit(money);
          break;
        case "2":
          System.out.println("출금할 금액을 입력해주세요.");
          money = Long.parseLong(sc.nextLine());
          account.withdraw(money);
          break;
        case "3":
          System.out.printf("현재 잔고 : %d 원",account.getMoney());
          break;
        case "4":
          System.out.println("거래 내역 : " + account.getTransactions());
          break;

      }
    } while (inputNo == "exit");
    
    
  }

}
