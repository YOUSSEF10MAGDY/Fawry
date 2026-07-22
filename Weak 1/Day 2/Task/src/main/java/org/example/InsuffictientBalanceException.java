package org.example;

public class InsuffictientBalanceException extends Exception {
    public InsuffictientBalanceException(String message){
        super(message);
    }
}
