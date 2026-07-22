import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        List<String> Students = new ArrayList<>();
        Scanner sc = new Scanner(System.in);
        boolean  isRunning= true;
        while (isRunning){
            System.out.println("\n--- Student Management System ---");
            System.out.println("1. Add a student ");
            System.out.println("2. Remove a student ");
            System.out.println("3. Check if exists ");
            System.out.println("4. Print all students ");
            System.out.println("5. Exit ");
            System.out.print("Choose an option: ");

            int choice = sc.nextInt();
            sc.nextLine();

            switch (choice){
                case 1 :
                    System.out.print("Enter student name to add: ");
                    String nameToAdd = sc.nextLine();
                    Students.add(nameToAdd);
                    System.out.println( nameToAdd + " has been added.");
                    break;
                case 2:
                    System.out.print("Enter student name to remove: ");
                    String nameToRemove = sc.nextLine();
                    if (Students.remove(nameToRemove)) {
                        System.out.println(  nameToRemove + " has been removed.");
                    } else {
                        System.out.println(" Student not found.");
                    }
                    break;
                case 3:
                System.out.print("Enter student name to check: ");
                String nameToCheck = sc.nextLine();
                if (Students.contains(nameToCheck)) {
                    System.out.println( nameToCheck + " is in the list.");
                } else {
                    System.out.println( nameToCheck + " is not in the list.");
                }
                break;
                case 4:
                    System.out.println("\n List of Students:");
                    if (Students.isEmpty()) {
                        System.out.println("The list is empty.");
                    } else {
                        for (String student : Students) {
                            System.out.println("- " + student);
                        }
                    }
                    break;

                case 5:
                    System.out.println(" ");
                    isRunning = false;
                    break;

                default:
                    System.out.println("️ Invalid choice. Please choose a number from 1 to 5.");
            }
        }


    }
}