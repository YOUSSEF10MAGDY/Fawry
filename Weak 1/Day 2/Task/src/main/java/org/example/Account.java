package org.example;

abstract class Account {
    String owner;
    double balance;

    public Account(String owner,double balance){
        this.owner=owner;
        this.balance=balance;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
       this.balance=balance;
    }

    public String getOwner() {
        return owner;
    }
public abstract void payment(double amount) throws InsuffictientBalanceException;
}
