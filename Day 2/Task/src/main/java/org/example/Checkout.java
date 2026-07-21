package org.example;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Checkout {
    public static void main(String[] args) {

        Account[] accounts = {
                new CardAcount("ALi", 500),
                new WalletAccount("Sara", 300),
                new CardAcount("Omar", 200)
        };
        double amount = 201;
        double totalpaid = 0;


        for (int i = 0; i < accounts.length; i++) {
            try {
                accounts[i].payment(amount);
                totalpaid += amount;
            } catch (InsuffictientBalanceException e) {
                System.out.println("Error: " + e.getMessage());
            }
        }
        System.out.println("totalpaid: " + totalpaid);
//        String[] owners   = {"Ali", "Sara", "Omar"};
//        String[] types    = {"card", "wallet", "card"};
//        double[] balances = {500, 300, 200};
//        double amount = 100;
//        double totalPaid = 0;
//        for (int i = 0; i < owners.length; i++) {
//            if (types[i].equals("card")) {
//                balances[i] = balances[i] - amount;
//                totalPaid += amount;
//                System.out.println(owners[i] + " card paid " + amount + ", balance " + balances[i]);
//            } else if (types[i].equals("wallet")) {
//                balances[i] = balances[i] - amount;
//                totalPaid += amount;
//                System.out.println(owners[i] + " wallet paid " + amount + ", balance " + balances[i]);
//            }
//        }
//        System.out.println("total paid: " + totalPaid);
    }
}
