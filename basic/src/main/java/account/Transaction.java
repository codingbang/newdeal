package account;

import java.util.Calendar;

public class Transaction {
  private Calendar date = Calendar.getInstance();
  private String transactionDate;
  private String transactionTime;
  private String inAndOut;
  private long tranceMoney;
  private long money;
  
  public Transaction(String inAndOut, long tranceMoney, long money) {
    this.transactionDate = date.get(Calendar.YEAR) + "-" + date.get(Calendar.MONTH) + "-" + date.get(Calendar.DATE);
    this.transactionTime = date.get(Calendar.HOUR) + ":" + date.get(Calendar.MINUTE) + ":" + date.get(Calendar.SECOND);
    this.inAndOut = inAndOut;
    this.tranceMoney = tranceMoney;
    this.money = money;
  }
  
}
