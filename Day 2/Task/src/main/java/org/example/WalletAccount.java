package org.example;

public class WalletAccount extends Account{
public WalletAccount(String owner, double balance){
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
