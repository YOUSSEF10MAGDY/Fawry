package org.example;

public class CardAcount extends Account{
    public CardAcount (String owner, double balance){
        super(owner, balance);
    }
    @Override
    public void payment(double amount) throws InsuffictientBalanceException{
        if (amount>getBalance()){
            throw new InsuffictientBalanceException("insufficient balance");
        }
        setBalance(getBalance()-amount);
        System.out.println("payment is done");
    }
}
