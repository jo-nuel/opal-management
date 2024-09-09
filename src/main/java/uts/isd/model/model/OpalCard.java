package uts.isd.model;

public class OpalCard
{
  private String cardNumber;
  private double balance;

  public OpalCard (String cardNumber, double balance)
  {
    this.cardNumber = cardNumber;
    this.balance = balance;
  }

  public String getCardNumber()
  {
    return cardNumber;
  }

  public void setCardNumber(String cardNumber)
  {
    this.cardNumber = cardNumber;
  }

  public double getBalance()
  {
    return balance;
  }

  public void setBalance()
  {
    this.balance = balance;
  }
}
    
